import 'package:apiintegration/ApiIntegration/get_api_cjson_without_model.dart';
import 'package:apiintegration/ApiIntegration/get_api_with_cjson_with_model.dart';
import 'package:apiintegration/ApiIntegration/get_api_with_custom_model.dart';
import 'package:apiintegration/ApiIntegration/getapi.dart';
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
      debugShowCheckedModeBanner: false,
      home: const GetApiCJsonWithoutModel(),
    );
  }
}
