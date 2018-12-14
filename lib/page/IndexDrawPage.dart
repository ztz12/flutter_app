import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/utils/PageRouteUtils.dart';
import 'package:flutter_app/page/LoginPage.dart';

//ignore: must_be_immutable
class IndexDrawPage extends StatelessWidget {
  String name, profileImage, email, background;

  IndexDrawPage({this.name, this.profileImage, this.email, this.background});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text(name),
          accountEmail: new Text(email),
          currentAccountPicture:
              new CircleAvatar(backgroundImage: new AssetImage(profileImage)),
          decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(background), fit: BoxFit.cover)),
        ),
        new ListTile(
          title: new Text("福利"),
          trailing: new Icon(
            Icons.whatshot,
            color: Colors.red,
          ),
          onTap: () {
            print("福利");
            Navigator.of(context).pop();
          },
        ),
        new ListTile(
          title: new Text("搜索"),
          trailing: new Icon(
            Icons.search,
            color: Colors.blue,
          ),
          onTap: () {
            print("搜索");
            //点击对应的关闭侧边栏
            Navigator.of(context).pop();
          },
        ),
        new ListTile(
          title: new Text("登录"),
          trailing: new Icon(
            Icons.contacts,
            color: Colors.amberAccent,
          ),
          onTap: (){
            Navigator.of(context).pop();
            routePageNavigator(context, new LoginPage());
          },
        ),
        new ListTile(
          title: new Text("退出"),
          trailing: new Icon(
            Icons.exit_to_app,
            color: Colors.green,
          ),
          onTap: () {
            print("退出");
            Navigator.of(context).pop();
            //退出APP
            exit(0);
          },
        )
      ],
    );
  }
}
