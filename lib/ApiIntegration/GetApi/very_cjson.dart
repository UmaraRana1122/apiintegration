import 'dart:convert';
import 'dart:math';

import 'package:apiintegration/Model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LastExampleScreen extends StatefulWidget {
  const LastExampleScreen({Key? key}) : super(key: key);

  @override
  _LastExampleScreenState createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {
  Future<ProductModel> getProductsApi() async {
    //create your own api
    final response = await http.get(
        Uri.parse('https://webhook.site/7f3ac786-7da9-4553-a24c-3a4a385388bb'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<ProductModel>(
                future: getProductsApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.events!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(snapshot.data!.events![index].id!
                                    .toString()),
                                subtitle: Text(snapshot
                                    .data!.events![index].description
                                    .toString()),
                              ),
                            ],
                          );
                        });
                  } else {
                    return Text('Loading');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
