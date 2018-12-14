import 'package:flutter/material.dart';
import 'package:flutter_app/utils/GoldenConfig.dart';
import 'package:flutter_app/page//IndexDrawPage.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/page/settingCard.dart';
import 'package:flutter_app/page/HomePage.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new ApplicationPage(),
));

class ApplicationPage extends StatefulWidget {
  @override
  ApplicationState createState() => new ApplicationState();
}

class ApplicationState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  String title = GoldenConfig.homeTab;
  int page = 0;
  PageController pageController;

  //定义底部导航
  final List<BottomNavigationBarItem> _bottomBar = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(
        icon: Icon(Icons.home), title: new Text(GoldenConfig.homeTab)),
    new BottomNavigationBarItem(
        icon: Icon(Icons.tune), title: new Text(GoldenConfig.classType)),
    new BottomNavigationBarItem(
        icon: Icon(Icons.person), title: new Text(GoldenConfig.mineType))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        drawer: new Drawer(
          child: new IndexDrawPage(
            name: GoldenConfig.name,
            profileImage: "images/profile_2.jpg",
            email: GoldenConfig.email,
            background: "images/bg_2.jpg",
          ),
        ),
        body: new PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
//          children: <Widget>[new ColumnWidget(),new ColumnWidget(),new ColumnWidget()],
        children: <Widget>[new HomePage(),setCard(context),setCard(context)],
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: _bottomBar,
          fixedColor: Colors.red,
          currentIndex: page,
          type: BottomNavigationBarType.fixed,
          onTap:_onTap,
        ),
      );
  }

  void _onTap(int index) {
    pageController.animateToPage(
        index, duration: const Duration(milliseconds: 300),
        curve: Curves.ease);
  }

  void _onPageChanged(int page) {
    setState(() {
      this.page = page;
      switch (page) {
        case 0:
          title = GoldenConfig.homeTab;
          break;
        case 1:
          title = GoldenConfig.classType;
          break;
        case 2:
          title = GoldenConfig.mineType;
          break;
      }
    });
  }
}
