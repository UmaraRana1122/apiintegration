import 'package:apiintegration/ApiIntegration/GetApi/get_api_cjson_without_model.dart';
import 'package:apiintegration/ApiIntegration/GetApi/get_api_with_cjson_with_model.dart';
import 'package:apiintegration/ApiIntegration/GetApi/get_api_with_custom_model.dart';
import 'package:apiintegration/ApiIntegration/GetApi/getapi.dart';
import 'package:apiintegration/ApiIntegration/GetApi/very_cjson.dart';
import 'package:apiintegration/ApiIntegration/PostApi/post_login.dart';
import 'package:apiintegration/ApiIntegration/PostApi/post_signup.dart';
import 'package:apiintegration/ApiIntegration/PostApi/post_upload_images.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const UploadMultipleImagesScreen(),
    );
  }
}
