import 'package:flutter/material.dart';
import 'package:flutter_app/DemoTwo.dart';

void main() => runApp(new ExpandApp());

class ExpandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Flutter",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
//      home: new ExampleText(),
      home: new TestExpand(),
    );
  }
}

//Stack 叠放布局
class TextStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return new Stack(
//      children: <Widget>[
//        new Text("yif"),
//        new Text("ztz"),
//      ],
//    );
    return new Stack(
      alignment: const Alignment(-0.5, -0.5),
      children: <Widget>[
        //Container 可以创建矩形视觉的元素
        Container(
          width: 200.0,
          height: 200.0,
          color: Colors.blue,
        ),
        new Text("stack"),
      ],
    );
  }
}

class TestExpand extends StatefulWidget {
  @override
  _ExpandState createState() => new _ExpandState();
}

class _ExpandState extends State<TestExpand> {
  final TextEditingController editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //使用Expand 与 TextFiled占满除按钮外的所有空间
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => showDialog(
                  context: context,
                  builder: (context){
                    return new AlertDialog(
                      title: new Text("Flutter"),
                      content: new Text("menu"),
                    );
                  }
                )
        ),
        title: new Text("Test"),
        actions: <Widget>[
          Icon(Icons.search)
        ],
      ),
      body: Row(
        children: <Widget>[
//          new Expanded(
//            child: new TextField(
//              controller: editController,
//              decoration: new InputDecoration(
//                hintText: "Type something",
//              ),
//            ),
//          ),
//          RaisedButton(
//              child: new Text("click"),
//              onPressed: () => print("text input: ${editController.text}")
//          )
          //Expanded 相当于 weight 进行比例划分显示区域
          new Expanded(
              flex: 2,
              child: new RaisedButton(
                  child: new Text("click One"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        //deprecated 已弃用 不建议用
                        builder: (context) {
                          return new AlertDialog(
                            title: new Text("Flutter"),
                            content: new Text("One"),
                          );
                        });
                  })),
          new Expanded(
              flex: 1,
              child: new RaisedButton(
                  child: new Text("click Two"),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Flutter"),
                          content: new Text("two"),
                        );
                      },
                    );
                  }))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //释放资源
    editController.dispose();
  }
}

class ExampleWidget extends StatefulWidget {
  @override
  _ExampleState createState() => new _ExampleState();
}

class _ExampleState extends State<ExampleWidget> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            controller: _controller,
            decoration: new InputDecoration(
              hintText: "input something",
            ),
          ),
          new RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context){
                    return new AlertDialog(
                      title: new Text("what you input"),
                      content: new Text(_controller.text),
                    );
                  }
              );
            },
            child: new Text("Done"),
          ),
          new Container(
            color: Colors.green,
            alignment: Alignment.topRight,
            width: 200.0,
            height: 200.0,
            padding: EdgeInsets.all(5.0),
            /*
        SizedOverflowBox主要的布局行为有两点：
        尺寸部分。通过将自身的固定尺寸，传递给child，来达到控制child尺寸的目的；
        超出部分。可以突破父节点尺寸的限制，超出部分也可以被渲染显示，与OverflowBox类似。
         */
            child: SizedOverflowBox(
              size: Size(100.0, 200.0),
              child: Container(
                color: Colors.red,
                width: 200.0,
                height: 100.0,
              ),
            ),
          ),
//Transform 矩阵变换
//          new Transform(transform: Matrix4.rotationZ(0.3),
//          child: new Container(
//            width: 400.0,
//            height: 400.0,
//            color: Colors.blue,
//          ),)
        ],
      ),
    );
  }
}

//TextFiled 文本输入widget
class TextFiledPage extends StatelessWidget {
  Widget buildTextFiled(TextEditingController controller) {
    return TextField(
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    controller.addListener(() {
      print("input ${controller.text}");
    });
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("textFiled"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: buildTextFiled(controller),
      ),
    );
  }
}
