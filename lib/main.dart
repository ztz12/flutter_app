import 'package:flutter/material.dart';
import 'package:flutter_app/page/settingCard.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
//    home: new ColumnWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }
  
  _getToggleChile() {
    if (toggle) {
      return new Text("toggle one");
    } else {
      return new MaterialButton(
        onPressed: () {},
        child: new Text("toggle two"),
      );
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
//      body: new Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//            new Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
    body: new Center(
      child: new Container(
        child: new Column(
          children: <Widget>[
            setCard(context)
          ],
        ),
      ),
    ),
//      body: new Center(
//        child: _getToggleChile(),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _toggle,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ColumnWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Text("One"),
        new Text("Two"),
      ],
    );
  }
}
