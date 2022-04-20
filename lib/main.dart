
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';



class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpclient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() async {
  HttpOverrides.global =new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),

  ));
}

