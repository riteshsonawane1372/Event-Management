



import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'Networking.dart';
import 'package:event_management/Widgets/dimension.dart';
import 'dart:convert';
import 'Widgets/Boxcontainer.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';





class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  PageController pagecontroller = PageController();
  double _currentPage =0;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    pagecontroller.addListener(() {
      setState(() {
        _currentPage=pagecontroller.page!;
        showSpinner =false;
        final spinkit= SpinKitSquareCircle(
          color: Colors.white,
          size: 50.0,
          controller: AnimationController(vsync:this , duration: Duration(milliseconds: 1500)),
        );

      });
    });
  }

  List dataList=[];
  List UpcomingEvents=[];
  late Map resMap;
  bool showSpinner =false;


    getdata() async {
    try {
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      var url = Uri.parse('https://organizergathrr.radarsofttech.in/api/getallevent');
      http.post(url, body: {"userId": "1"}).then(
              (response) {

            print("Reponse status : ${response.statusCode}");
            print("Response body : ${response.body}");
            var myresponse =jsonDecode(response.body);
            setState(() {
              dataList=myresponse['allevents'];
              UpcomingEvents =myresponse['upcomigevents'];
              resMap=myresponse;
            });

            return myresponse;
          });


    } catch (e) {
      print(e.toString());
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    pagecontroller.dispose();

  }

  @override
  Widget build(BuildContext context) {
    var sizeHeight = MediaQuery.of(context).size.height;    // currnt device 780
    var sizeWidth = MediaQuery.of(context).size.width;    // 360 width


    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    children: [
                          Row(
                            children: [
                              Stack(
                                  children:[

                                    Container(
                                      height: sizeHeight-350,
                                      width: sizeWidth,
                                      color: Colors.green[500],
                                        child:Column(
                                          children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container( padding: EdgeInsets.only(top: 10,left: 5,),
                                                child: Text('Home',
                                                  style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)),
                                            Container(child: Icon(Icons.notifications,color: Colors.white,),
                                              padding: EdgeInsets.only(left: sizeWidth/1.4),),

                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(top: 50),
                                              child:uBox(
                                                details: dataList[1]['eventDescription'],
                                                date:dataList[1]['eventStartdate'] ,
                                                topic: dataList[1]['eventName'],
                                                image:NetworkImage(dataList[1]['event_banner_img1']),)
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(padding: EdgeInsets.only(right: 200,top: 50),
                                              child: Text('Upcoming',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w600),)),
                                        ],
                                      ),


                                    ],

                                  ),
                                ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 350),
                                      child: Container(
                                        height: 200,width: sizeWidth,
                                        child: PageView.builder(
                                          controller: pagecontroller,
                                            itemCount: UpcomingEvents.length==null?1:UpcomingEvents.length,

                                            itemBuilder: (context,position)
                                            {
                                              _currentPage=position.toDouble();
                                              print(_currentPage);
                                              return _PageBuildItem(position);

                                            }),
                                      ),
                                    ),



                                ]
                              ),

                            ],
                          ),
                      DotsIndicator(
                        dotsCount:UpcomingEvents.length==null?0:UpcomingEvents.length ,
                        position: _currentPage,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),


                      SingleChildScrollView(
                        child: Column(
                              children: [
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.only(top: 10),
                                    shrinkWrap: true,
                                    itemCount:dataList.length==null?0: dataList.length,
                                    itemBuilder: (context,index){
                                    showSpinner=false;
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: uBox(
                                            details:dataList[index]['eventDescription'] ,
                                            date:dataList[index]['eventStartdate'] ,
                                            topic: dataList[index]['eventName'],
                                            image: NetworkImage(dataList[index]['event_banner_img1'],)),
                                      );
                                    }),

                              ],
                            ),

                      ),



                    ],
                  
                  ),
              ),

          ),

        ),


      ),
    );
  }

  Widget _PageBuildItem(int index){   /// PageViewBuilderContent
      return uBox(
          details:UpcomingEvents[index]['eventDescription'] ,
          date:UpcomingEvents[index]['eventStartdate'] ,
          topic: UpcomingEvents[index]['eventName'],
          image: NetworkImage(UpcomingEvents[index]['event_banner_img1'],));
  }



}







