import 'dart:convert'; // Importing the dart:convert library for JSON decoding.
import 'package:apiintegration/Widgtes/reusable_row.dart'; // Importing the reusable_row widget.
import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:http/http.dart'
    as http; // Importing the http package for making HTTP requests.

class GetApiCJsonWithoutModel extends StatefulWidget {
  const GetApiCJsonWithoutModel({super.key});

  @override
  State<GetApiCJsonWithoutModel> createState() =>
      _GetApiCJsonWithoutModelState();
}

class _GetApiCJsonWithoutModelState extends State<GetApiCJsonWithoutModel> {
  var data; // Variable to hold the API data.

  // Function to fetch data from the API.
  Future<void> getUserApi() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/users')); // Making a GET request to the API.
    if (response.statusCode == 200) {
      data = jsonDecode(response.body
          .toString()); // Decoding the JSON response if the status code is 200 (OK).
    } else {
      // Handle error case
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GetApi Complex Json Without Model",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18), // Setting the title style.
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(), // Calling the getUserApi function.
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(
                        "loading"); // Displaying loading text while the data is being fetched.
                  } else {
                    return ListView.builder(
                        itemCount: data
                            .length, // Setting the number of items in the list.
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                // Using the ReusableRow widget to display user data.
                                ReusableRow(
                                    title: 'Name',
                                    value: data[index]['name'].toString()),
                                ReusableRow(
                                    title: 'Username',
                                    value: data[index]['username'].toString()),
                                ReusableRow(
                                    title: 'Address',
                                    value: data[index]['address']['street']
                                        .toString()),
                                ReusableRow(
                                    title: 'Geo',
                                    value: data[index]['address']['geo']
                                        .toString()),
                              ],
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
