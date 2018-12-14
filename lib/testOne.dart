import 'package:flutter/material.dart';

//void main() => runApp(new AnimatorApp());
void main() => runApp(new DemoApp());

//水平布局使用row 竖直布局使用column
//StatelessWidget 整个生命周期都不会改变 build方法只会调用一次  只能展示用户信息,不能交互
class AnimatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "hello flutter",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new SampleWidget(
        title: "Fade Test",
      ),
    );
  }
}

//StatefulWidget 只要状态发生改变，就会调用这个方法  可以改变状态来改变UI 能够与用户进行交互
class SampleWidget extends StatefulWidget {
  SampleWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SampleState createState() => new _SampleState();
}

//通过with 实现对多重继承支持
class _SampleState extends State<SampleWidget> with TickerProviderStateMixin {
  AnimationController controller;

  //Animation 类扩展 CurvedAnimation 将控制器和动画传入到AnimationWidget中
  //实现logo 淡入淡出动画
  CurvedAnimation curved;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    //Curves.easeIn 一种动画的方式
    curved = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
//        child: new Container(
//          child: new FadeTransition(
//              opacity: curved,
//              child: new FlutterLogo(size: 100.0,),
//          ),
//        ),
        child: new CustomWidget("future"),
      ),
      floatingActionButton: FloatingActionButton(
          tooltip: "Fade",
          child: new Icon(Icons.brush),
          onPressed: () {
            controller.forward();
          }),
    );
  }
}

//自定义Widget
class CustomWidget extends StatelessWidget {
  final String label;

  CustomWidget(this.label);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
      onPressed: () {},
      child: new Text(label),
    );
  }
}

//使用canvas draw与paint
class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) =>
      oldDelegate.points != points;
}

class SignatureWidget extends StatefulWidget {
  @override
  _SignatureState createState() => new _SignatureState();
}

class _SignatureState extends State<SignatureWidget> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
            icon: new Icon(Icons.menu),
            onPressed: () => showDialog(
                context: context,
                builder: (context){
                  new AlertDialog(
                    title: new Text("Flutter"),
                    content: new Text("Love Flutter"),
                  );
                }
            )
        ),
        title: new Text("Painter"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: null)
        ],
      ),
      body: new GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox render = context.findRenderObject();
            Offset localPos = render.globalToLocal(details.globalPosition);
            _points = new List.from(_points)..add(localPos);
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
        child: new CustomPaint(
          painter: new SignaturePainter(_points),
        ),
      ),
    );
  }
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SignatureWidget(),
    );
  }
}
