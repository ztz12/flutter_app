import 'package:flutter/material.dart';
import 'package:flutter_app/utils/PageRouteUtils.dart';
import 'package:flutter_app/AppbarDemo.dart';

Widget setCard(BuildContext context) {
  return new Container(
    color: Colors.white,
    margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
    padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(
//          width: MediaQuery.of(context).size.width / 4,
          child: new Expanded(
              child: new FlatButton(
                  onPressed: () {
                    routePageNavigator(context, new AppBarBottomSample());
                  },
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          child: new CircleAvatar(
                            radius: 20.0,
                            child: new Icon(Icons.invert_colors, color: Colors.white),
                            backgroundColor: new Color(0xFFB86A0D),
                          ),
                        ),
                        new Container(
                          child: new Text("推荐",
                              style: new TextStyle(
                                  color: Colors.black54, fontSize: 14.0)),
                        )
                      ],
                    ),
                  )
              ),
            flex: 1,
          ),
        ),
        new Container(
          child: new Expanded(
              child: new FlatButton(
                  onPressed: () {
                    routePageNavigator(context, new AppBarBottomSample());
                  },
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          child: new CircleAvatar(
                            radius: 20.0,
                            child: new Icon(Icons.edit, color: Colors.white),
                            backgroundColor: new Color(0xFF63616D),
                          ),
                        ),
                        new Container(
                          child: new Text("感谢",
                              style: new TextStyle(
                                  color: Colors.black54, fontSize: 14.0)),
                        )
                      ],
                    ),
                  )
              ),
            flex: 1,
          )
        ),
        new Container(
          child: new Expanded(
              child: new FlatButton(
                  onPressed: () {
                    routePageNavigator(context, new AppBarBottomSample());
                  },
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          child: new CircleAvatar(
                            radius: 20.0,
                            child: new Icon(Icons.update, color: Colors.white),
                            backgroundColor: new Color(0xFFB86A0D),
                          ),
                        ),
                        new Container(
                          child: new Text("更新",
                              style: new TextStyle(
                                  color: Colors.black54, fontSize: 14.0)),
                        )
                      ],
                    ),
                  )
              ),
            flex: 1,
          ),
        ),
        new Container(
          child: new Expanded(
              child: new FlatButton(
                  onPressed: () {
                    routePageNavigator(context, new AppBarBottomSample());
                  },
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(bottom: 6.0),
                          child: new CircleAvatar(
                            radius: 20.0,
                            child: new Icon(Icons.perm_data_setting,
                                color: Colors.white),
                            backgroundColor: new Color(0xFF636269),
                          ),
                        ),
                        new Container(
                          child: new Text("关于",
                              style: new TextStyle(
                                  color: Colors.black54, fontSize: 14.0)),
                        )
                      ],
                    ),
                  )
              ),
            flex: 1,
          ),
        ),
      ],
    ),
  );
}
