import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:travelgod/datatypes/data.dart';
import 'package:travelgod/phoenix/repository.dart';

class RedContainerApp extends StatefulWidget {
  @override
  _RedContainerAppState createState() => _RedContainerAppState();
}

class _RedContainerAppState extends State<RedContainerApp> {
  var client;

  @override
  void initState() {
    client= Repository(
      Dio(
        BaseOptions(
          contentType: "application/json",
          baseUrl: "http://10.0.2.2:8000",
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Red Container App'),
        ),
        body: FutureBuilder<Test>(
          future: client.test(),
          builder: (context, snapshot) {
            var posts;
            if (snapshot.connectionState == ConnectionState.done) {
              posts = snapshot.data??"";
              print(posts);
            }
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return Container(
              color: Colors.red,
              width: 200.0,
              height: 200.0,
              child: Center(
                child: Text(posts.Hello,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}