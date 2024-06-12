import 'dart:convert'; // Importing the dart:convert library for JSON decoding.

import 'package:apiintegration/Model/first_model.dart'; // Importing the custom PostsModel class.
import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:http/http.dart'
    as http; // Importing the http package for making HTTP requests.

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {
  // List to hold post data from the API.
  List<PostsModel> postList = [];

  // Function to fetch data from the API and parse it into post models.
  Future<List<PostsModel>> getPostApi() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts')); // Making a GET request to the API.
    var data =
        jsonDecode(response.body.toString()); // Decoding the JSON response.
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostsModel.fromJson(i as Map<String,
            dynamic>)); // Parsing JSON data into PostsModel instances and adding to the list.
      }
      return postList; // Returning the list of posts.
    } else {
      return postList; // Returning an empty list in case of an error.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Api"), // Setting the title of the AppBar.
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(), // Calling the getPostApi function.
                builder: (context, snapshot) {
                  // Checking if the snapshot has data.
                  if (!snapshot.hasData) {
                    return Text(
                        "Loading"); // Showing a loading text while data is being fetched.
                  } else {
                    return ListView.builder(
                        itemCount: postList
                            .length, // Setting the number of items in the list.
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Displaying the post title.
                                Text(
                                  "Title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Text(postList[index].title.toString()),
                                SizedBox(
                                  height: 5,
                                ),
                                // Displaying the post body.
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(postList[index].body.toString()),
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
