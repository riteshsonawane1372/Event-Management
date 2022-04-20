import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:event_management/deatils.dart';


/// Upper style box
class uBox extends StatelessWidget {

  final NetworkImage image;
  final String topic;
  final date;
  final String details;
  uBox({
    required this.image,
    required this.topic,
    required this.date,
    required this.details});


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,

          ),
          child:
          Wrap(
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 10,top: 10),
                                        child: Text(topic,overflow: TextOverflow.visible,
                                      style: TextStyle(fontSize: 12,color:Colors.black,fontWeight: FontWeight.w600),maxLines: 1,)),
                                    SizedBox(height: 10,),

                                    Container(
                                      padding: EdgeInsets.only(right:50),
                                        child:
                                      Text('${date}| 2022',overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 10,color:Colors.grey,fontWeight: FontWeight.w600),maxLines: 3,)),
                                    SizedBox(height: 10,),

                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                        child: Text(details,overflow: TextOverflow.fade,
                                      style: TextStyle(fontSize: 10,color:Colors.grey,fontWeight: FontWeight.w600),maxLines: 2,)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: ElevatedButton(
                                            onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(
                                                  builder: (context)=>DetailClass(
                                                    images: image,topic: topic,details: details,time: date,place: 'COEP',CityName: 'Pune',)));

                                            },
                                            child: Text('View more',style: TextStyle(fontSize: 10),),)),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 200,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                                image: DecorationImage(
                                    image: image,
                                    fit: BoxFit.fill
                                )
                            ),),


                        ),
                      ],
                    ),
                  ],
                ),
              ]
          ),
        )
    );
  }
}
class ContainerBox extends StatelessWidget {

  const ContainerBox({
    required this.sizeHeight,
    required this.sizeWidth,
    required this.color,
    required this.text1,
    required this.image
  });

  final double sizeHeight;
  final double sizeWidth;
  final Color color;
  final String text1;
  final NetworkImage image;

  @override
  Widget build(BuildContext context) {
    return Container(                  /// Top Container
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow:  [BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
          ),]
      ),
      height: sizeHeight/3.54,
      width: sizeWidth/1.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                child: Text('$text1'),
              ),

            ],
          ),  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  height:550,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: image,

                      )
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}