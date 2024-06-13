import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostSignUpScreen extends StatefulWidget {
  const PostSignUpScreen({super.key});

  @override
  State<PostSignUpScreen> createState() => _PostSignUpScreenState();
}

class _PostSignUpScreenState extends State<PostSignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        //for showing the id and token
        var data = jsonDecode(response.body.toString());
        // print(data);
        //but if you want to show the just token
        print(data['token']);
        print("Account created successfully");
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Api Sign Up",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "QuicksandMedium",
                ),
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontFamily: "QuicksandRegular",
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  errorStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontFamily: "QuicksandRegular",
                    color: Colors.red,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontFamily: "QuicksandMedium",
                ),
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontFamily: "QuicksandRegular",
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  errorStyle: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontFamily: "QuicksandRegular",
                    color: Colors.red,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Sign Up"),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
