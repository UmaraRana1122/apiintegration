import 'package:flutter/material.dart';

//Flutter Upload File/Image To Rest API/Server Using Multiport Http Request with Null
class UploadMultipleImagesScreen extends StatefulWidget {
  const UploadMultipleImagesScreen({super.key});

  @override
  State<UploadMultipleImagesScreen> createState() =>
      _UploadMultipleImagesScreenState();
}

class _UploadMultipleImagesScreenState
    extends State<UploadMultipleImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Uplod File Srvr Using Multiport Http rqt",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}
