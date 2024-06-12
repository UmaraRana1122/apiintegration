import 'dart:convert'; // Importing the dart:convert library for JSON decoding.

import 'package:apiintegration/Model/user_model.dart'; // Importing the user model.
import 'package:apiintegration/Widgtes/reusable_row.dart'; // Importing the reusable_row widget.
import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:http/http.dart'
    as http; // Importing the http package for making HTTP requests.

class GetApiWithCJsonWithModel extends StatefulWidget {
  const GetApiWithCJsonWithModel({super.key});

  @override
  State<GetApiWithCJsonWithModel> createState() =>
      _GetApiWithCJsonWithModelState();
}

class _GetApiWithCJsonWithModelState extends State<GetApiWithCJsonWithModel> {
  List<UserModel> userList = []; // List to hold user data from the API.

  // Function to fetch data from the API and parse it into user models.
  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users')); // Making a GET request to the API.
    var data =
        jsonDecode(response.body.toString()); // Decoding the JSON response.
    if (response.statusCode == 200) {
      for (Map i in data) {
        print(i['name']); // Printing the name of each user to the console.
        userList.add(UserModel.fromJson(i as Map<String,
            dynamic>)); // Parsing JSON data into UserModel instances.
      }
      return userList; // Returning the list of user models.
    } else {
      return userList; // Returning an empty list in case of an error.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(), // Calling the getUserApi function.
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(); // Showing a loading indicator while data is being fetched.
                  }
                  return ListView.builder(
                      itemCount: userList
                          .length, // Setting the number of items in the list.
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              // Using the ReusableRow widget to display user data.
                              ReusableRow(
                                  title: "Name",
                                  value: snapshot.data![index].name.toString()),
                              ReusableRow(
                                  title: "Email",
                                  value:
                                      snapshot.data![index].email.toString()),
                              ReusableRow(
                                  title: "UserName",
                                  value: snapshot.data![index].username
                                      .toString()),
                              ReusableRow(
                                  title: "Address",
                                  value: snapshot.data![index].address!.city
                                      .toString()),
                              ReusableRow(
                                  title: "ZipCode",
                                  value: snapshot.data![index].address!.zipcode
                                      .toString()),
                              ReusableRow(
                                  title: "Geo",
                                  value: snapshot.data![index].address!.geo!.lat
                                      .toString()),
                              ReusableRow(
                                  title: "Lng",
                                  value: snapshot.data![index].address!.geo!.lng
                                      .toString()),
                            ],
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
