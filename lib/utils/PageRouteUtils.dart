import 'package:flutter/material.dart';

routePageNavigator(BuildContext context, Widget v) {
  Navigator.of(context).push(new PageRouteBuilder(
    opaque: false,
    //参数不能重复定义，否则报错 比如定义了'_'，就不能在增加相同参数，使用'__'取代
    pageBuilder: (context, _,__) {
      return v;
    },
    transitionsBuilder:
        (context, Animation<double> animation, _, Widget child) {
      return new FadeTransition(
        opacity: animation,
        child: new FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: child,
        ),
      );
    },
  ));
}
