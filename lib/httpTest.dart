import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
    final responseJson = jsonDecode(response.body);
    return Post.fromJson(responseJson);
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String,dynamic> json){
      return new Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
  }
}

void main() => runApp(new HttpWidget());

class HttpWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Flutter",
      home: new Scaffold(
        appBar: new AppBar(
          leading: Icon(Icons.arrow_back),
          title: new Text("Flutter"),
        ),
        body: new Center(
          child: new FutureBuilder<Post>(
              future: fetchPost(),
              builder: (context,result){
                if(result.hasData){
                  return new Text(result.data.body);
                }else if(result.hasError){
                  return new Text("${result.error}");
                }
                return new CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}

