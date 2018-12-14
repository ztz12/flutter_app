import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new ListApp());

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "flutter",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new TestRowWidget(),
    );
  }
}

class ListWidget extends StatefulWidget {
  ListWidget({Key key}) : super(key: key);

  @override
  _ListState createState() => new _ListState();
}

class _ListState extends State<ListWidget> {
  List widgets = [];

  //初始化widget时调用，只会调用一次
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDate();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView App"),
      ),
      body: new ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int pos) {
          return getRow(pos);
        },
      ),
    );
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["title"]}"));
  }

  //可以在UI线程中运行网络请求，因为是异步UI
  loadDate() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      //JSON 废弃使用小写的json
      widgets = json.decode(response.body);
    });
  }
}

//水平布局 Row
class TestRowWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new Text("1"),
        new Text("2"),
        new Text("3"),
      ],
    );
  }
}
