import 'dart:convert'; // Importing the dart:convert library for JSON decoding.

import 'package:flutter/material.dart'; // Importing the Flutter material package.
import 'package:http/http.dart'
    as http; // Importing the http package for making HTTP requests.

// Building a List with JSON Data using a custom Model
class GetApiWithCustomModel extends StatefulWidget {
  const GetApiWithCustomModel({super.key});

  @override
  State<GetApiWithCustomModel> createState() => _GetApiWithCustomModelState();
}

class _GetApiWithCustomModelState extends State<GetApiWithCustomModel> {
  List<Photos> photoList = []; // List to hold photo data from the API.

  // Function to fetch data from the API and parse it into photo models.
  Future<List<Photos>> getPhotos() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos')); // Making a GET request to the API.
    var data =
        jsonDecode(response.body.toString()); // Decoding the JSON response.
    print(data); // Printing the raw data for debugging.
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(
            title: i['title'],
            url: i['url'],
            id: i['id']); // Creating a Photos instance from the JSON data.
        photoList.add(photos); // Adding the photo instance to the list.
      }
      return photoList; // Returning the list of photos.
    } else {
      return photoList; // Returning an empty list in case of an error.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotos(), // Calling the getPhotos function.
                builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
                  // Checking if the snapshot has data.
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(); // Showing a loading indicator while data is being fetched.
                  } else if (snapshot.hasError) {
                    return Text(
                        'Error: ${snapshot.error}'); // Displaying an error message if an error occurs.
                  }
                  return ListView.builder(
                      itemCount: photoList
                          .length, // Setting the number of items in the list.
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot
                                .data![index].url
                                .toString()), // Displaying the photo URL as an image.
                          ),
                          subtitle: Text(snapshot.data![index].title
                              .toString()), // Displaying the photo title.
                          title: Text('Notes id: ' +
                              snapshot.data![index].id
                                  .toString()), // Displaying the photo ID.
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

// Custom model class for Photos.
class Photos {
  String title, url;
  int id;

  // Constructor to initialize the photo instance.
  Photos({required this.title, required this.url, required this.id});
}
