import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;

class UploadMultipleImagesScreen extends StatefulWidget {
  const UploadMultipleImagesScreen({super.key});

  @override
  State<UploadMultipleImagesScreen> createState() =>
      _UploadMultipleImagesScreenState();
}

class _UploadMultipleImagesScreenState
    extends State<UploadMultipleImagesScreen> {
  File? image;
  final picker = ImagePicker();
  bool showSpinner = false;

  Future getImage() async {
    try {
      final pickedFile =
          await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
      if (pickedFile != null) {
        setState(() {
          image = File(pickedFile.path);
        });
      } else {
        print("No image selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> uploadImage() async {
    if (image == null) {
      print("No image to upload");
      return;
    }

    setState(() {
      showSpinner = true;
    });

    try {
      var stream = http.ByteStream(image!.openRead());
      stream.cast();
      var length = await image!.length();
      var uri = Uri.parse('http://fakestoreapi.com/products');
      var request = http.MultipartRequest('POST', uri);
      request.fields['title'] = "Static title";
      var multipart = http.MultipartFile('image', stream, length);
      request.files.add(multipart);
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Image uploaded');
      } else {
        print('Failed to upload image');
      }
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Upload File to Server",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: image == null
                    ? Center(
                        child: Text("No image selected"),
                      )
                    : Center(
                        child: Image.file(
                          image!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: getImage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Pick Image",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: uploadImage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Upload Image",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: UploadMultipleImagesScreen()));
}
