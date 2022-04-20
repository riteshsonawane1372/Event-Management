// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'Widgets/readMore.dart';

class DetailClass extends StatelessWidget {



  DetailClass({required this.images,
    required this.topic,
    required this.details,
    required this.time,
    required this.place,
    required this.CityName
  });

  final NetworkImage images;
  final String topic;
  final String details;
  final String time;
  final String place;
  final String CityName;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Event Details',style: TextStyle(fontSize: 15),),
          backgroundColor: Colors.green[500],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Stack(
                        children:[
                          Container(
                              child: Opacity(
                                  opacity: 0.9,
                                  child: Image(image: images,))),
                          // Container(
                          //   padding: EdgeInsets.only(top: 80),
                          //   child: Text('$topic',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 120),
                          //   child: Text('$details',maxLines:2,overflow:TextOverflow.visible,
                          //       style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600)),
                          // )

                        ]
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 10,left: 20),
                          child: Text('${topic}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),),
                      ],
                    ),
                  )

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10),
                child: Row(
                  children: [
                    Container(
                      child: Text('${time} |',style: TextStyle(color: Colors.grey),),),
                    Container(
                      child: Text(' ${place}',style: TextStyle(color: Colors.grey)),),
                    Container(
                      child: Text(' |${CityName},',style: TextStyle(color: Colors.grey))

                    )],
                ),
              ),

              Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 50),
                            child: DescriptionTextWidget(text: details,)
                          ),
                        ],
                      ),
                    )
                  ],
                ),

              Row(
                children: [
                  Expanded(
                    child: Container
                      (height: 50
                        ,child: ElevatedButton(onPressed: (){}, child: Text('Check in'))),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

