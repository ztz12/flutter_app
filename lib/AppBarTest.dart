
import 'package:flutter/material.dart';

void main() => runApp(new AppBarApp());

class AppBarApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new _AppBarWidget(),
    );
  }
}

class _AppBarWidget extends StatefulWidget{
  @override
  _AppBarState createState() => new _AppBarState();

}

class _AppBarState extends State<_AppBarWidget> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: choices.length, vsync: this);
  }

  void _nextPage(int dealt){
    int index = _tabController.index+dealt;
    if(index<0||index>=_tabController.length){
      return;
    }
    _tabController.animateTo(index);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Appbar Bottom Widget"),
        //leading 通常是左部按键 不设置时一般是Drawer图标或者返回图标
        //flexibleSpace ：位于 bottom 和 leading 之间。
        leading: new IconButton(
            tooltip: "Previous choice",
            icon: new Icon(Icons.arrow_back),
            onPressed: () {_nextPage(-1);
            }),
        actions: <Widget>[
          new IconButton(
            tooltip: "Next choice",
              icon: new Icon(Icons.arrow_forward),
              onPressed: (){_nextPage(1);})
        ],
        //控件实现PreferredSize 可以放到AppBar中使用
        bottom: new PreferredSize(
            child: new Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: new Container(
                  height: 48.0,
                  alignment: Alignment.center,
                  child: new TabPageSelector(controller: _tabController,),
                )),
            preferredSize: const Size.fromHeight(48.0)),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice){
            return new Padding(padding: EdgeInsets.all(16.0),
            child: new CardChoice(choice: choice,),);
          }).toList()),
    );
  }
}

class Choice{
 const Choice({
    this.title,
    this.iconData
});
  final String title;
  final IconData iconData;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: "Car",iconData: Icons.directions_car),
  const Choice(title: "Bus",iconData: Icons.directions_bus),
  const Choice(title: "Bike",iconData: Icons.directions_bike),
  const Choice(title: "Railway",iconData: Icons.directions_railway),
  const Choice(title: "Boat",iconData: Icons.directions_boat),
  const Choice(title: "Walk",iconData: Icons.directions_walk),
];

class CardChoice extends StatelessWidget{
  CardChoice({Key key,this.choice}) :super(key:key);
  final Choice choice;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    // TODO: implement build
    return new Card(
      color: Colors.blue,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.iconData,size: 128.0,color: textStyle.color,),
            new Text(choice.title,style: textStyle,)
          ],
        ),
      ),
    );
  }
}
