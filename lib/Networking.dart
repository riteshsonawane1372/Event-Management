// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:http/io_client.dart';
// import 'homeScreen.dart';
//
// class Network{
//
//
//    void getdata() async {
//     try {
//       final ioc = new HttpClient();
//       ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
//       final http = new IOClient(ioc);
//       var url = Uri.parse('https://organizergathrr.radarsofttech.in/api/getallevent');
//       http.post(url, body: {"userId": "1"}).then(
//               (response) {
//
//             print("Reponse status : ${response.statusCode}");
//             print("Response body : ${response.body}");
//             var myresponse =jsonDecode(response.body);
//
//             Map results = myresponse;
//             print(results);
//
//             return myresponse;
//           });
//
//
//     } catch (e) {
//       print(e.toString());
//     }
//
//   }
//
// }