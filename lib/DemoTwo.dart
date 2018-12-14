import 'package:flutter/material.dart';


//为了继承主题依据，widget需要位于MaterialApp内才能正常显示
void main() =>
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false, //去除APP右上角DEBUG标签
      title: "hi",
      theme: new ThemeData(primarySwatch: Colors.red),
      home: new ExampleText(),
    ));

//自定义AppBar
//ignore immutable
class _MyAppBar extends StatelessWidget {
  final Widget title;

  //传入参数 需要用{}包裹 才可以调用显示
  _MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            //onPressed:null 会禁用Button 无法点击
              icon: new Icon(Icons.menu),
              tooltip: "Menu",
              onPressed: () =>
                  showDialog(
                      context: context,
                      builder: (context){
                       return new AlertDialog(
                         title: new Text("menu"),
                         content: new Text("包子"),
                       );
                      }
                  )
          ),
          //占据剩余的空间
          new Expanded(
            child: title,
          ),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: "Search", onPressed: null)
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Material 是UI呈现的一张纸
    return new Material(
      child: new Column(
        children: <Widget>[
          new _MyAppBar(
            title: new Text(
              "Example title",
              style: Theme
                  .of(context)
                  .primaryTextTheme
                  .title,
            ),
          ),
          new Expanded(
              child: new Center(
                child: new Text("flutter"),
              ))
        ],
      ),
    );
  }
}

class TurHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            tooltip: "Menu", icon: new Icon(Icons.menu), onPressed: null),
        title: new Text("Example title"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search), tooltip: "Search", onPressed: null)
        ],
      ),
      //body 占屏幕大部分
      body: new Center(
        child: new Text("Flutter"),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "Brush",
          child: new Icon(Icons.brush),
          onPressed: () =>
              showDialog(
                  context: context,
                  builder: (context){
                    new AlertDialog(
                      title: new Text("menu"),
                      content: new Text("包子"),
                    );
                  }
              )
      ),
    );
  }
}

//处理手势
class GestureTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          //tooltip 作为一种标签解释这个Button的功能
            tooltip: "menu",
            icon: new Icon(Icons.menu),
            onPressed: null),
        title: new Text("GestureTest"),
        actions: <Widget>[
          new IconButton(
              tooltip: "Search", icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new Center(
        child: new GestureDetector(
          onTap: () =>
              showDialog(
                  context: context,
                  builder: (context){
                    new AlertDialog(
                      title: new Text("Gesture"),
                      content: new Text("gesture"),
                    );
                  }
              ),
          child: new Container(
            alignment: Alignment.center,
            height: 100.0,
            width: 100.0,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(5.0),
                color: Colors.blue[500]),
            child: new Text("Click"),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "Fab",
          child: new Icon(Icons.add),
          onPressed: () =>
              showDialog(
                  context: context,
                  builder: (context){
                    return new AlertDialog(
                      title: new Text("Gesture"),
                      content: new Text("gesture"),
                    );
                  }
              )
      ),
    );
  }
}

class ExampleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          //tooltip 作为一种标签解释这个Button的功能
            tooltip: "menu",
            icon: new Icon(Icons.menu),
            onPressed: null),
        title: new Text("GestureTest"),
        actions: <Widget>[
          new IconButton(
              tooltip: "Search", icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new Center(
        child: new Container(
          height: 200.0,
          padding: EdgeInsets.all(32.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //MainAxisSize.max 相当于 match_parent  MainAxisSize.min 相当于 wrap_content
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: new Text(
                        "Mike",
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    new Text(
                      "Lucy",
                      style: new TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
              new Icon(Icons.star, color: Colors.red[500]),
              new Text("41"),
            ],
          ),
        ),
      ),
    );
  }
}

class TextColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          //tooltip 作为一种标签解释这个Button的功能
            tooltip: "menu",
            icon: new Icon(Icons.menu),
            onPressed: null),
        title: new Text("GestureTest"),
        actions: <Widget>[
          new IconButton(
              tooltip: "Search", icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        //使用Row 水平放置 子view的权重将基于垂直线
        //使用Column 垂直放置 子view的权重将基于水平线
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
            height: 100.0,
            width: 100.0,
            padding: EdgeInsets.all(8.0),
            color: Colors.red[500],
            child: new Text("test"),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
