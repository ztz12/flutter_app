import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/api/Api.dart';
import 'package:flutter_app/api/http.dart';
import 'package:flutter_app/utils/Constant.dart';
import 'package:flutter_app/model/DailyResponse.dart';
import 'package:flutter_app/utils/SharedPrfUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/utils/HomeListView.dart';

//void main() => runApp(new MaterialApp(
//  home: new HomePage(),
//));

class HomePage extends StatefulWidget {
  _NewsListState createState() => new _NewsListState();
}

//使用 with 实现类似多重继承
class _NewsListState extends State<HomePage> with HttpExt {
  var listData;
  String snapshot;
  var url = Api.feedUrl + '福利/5/1';

  ///该方法暂时放弃
  Future<Null> loadData() async {
    await get(Api.todayUrl); //注意await关键字
    if (!mounted) return; //异步处理，防止报错
    setState(() {}); //什么都不做，只为触发RefreshIndicator的子控件刷新
  }

  Future<Null> _pullToRefresh() async {
    requestHomeBanner(url);
    //Future 提供链式调用，﻿
    // new Future.then(funA()).then(funB());  明确表现出了后者依赖前者设置的变量值
    await get(Api.todayUrl).then<void>((String data){
      setState(() {
        snapshot = data;
        print("刷新成功");

        ///缓存网络请求的数据
        SharedPrfUtils.saveString(Api.todayUrl, json.encode(data));
      });
    }); //注意await关键字
  }

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: buildDailyListView(context, snapshot, listData),
      onRefresh: _pullToRefresh,
    );
  }

  void loadingData() {
    ///请求banner数据
    loadBannerData();

    ///请求首页item数据
    getHomeItemData();
  }

  ///请求banner数据
  void loadBannerData() async {
    print("feedListUrl: $url");

    ///先从缓存中获取banner图片数据
    var cacheData = await SharedPrfUtils.get(url);
    if (cacheData != null) {
      //将json字符串转化成Dart对象,这里是Map
      var userMap = json.decode(cacheData);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(userMap);
      print("banner获取缓存数据成功");
      setState(() {
        listData = categoryResponse.results;
      });
    } else {
      print("banner网络请求数据成功");
      requestHomeBanner(url);
    }
  }

  ///通过网络请求banner数据
  void requestHomeBanner(String url) {
    getGankfromNet(url).then((CategoryResponse categoryResponse) {
      if (!categoryResponse.error) {
        var _listData = categoryResponse.results;
        print(_listData);
        if (_listData.length > 0) {
          setState(() {
            listData = _listData;
            //目前只缓存第一页数据
            SharedPrfUtils.saveString(
              //json.encode()序列化json
                url, json.encode(categoryResponse.toJson()));
          });
        }
      }
    });
  }

  ///请求首页item数据
  void getHomeItemData() {
    getCacheData(Api.todayUrl).then<void>((String data) {
      setState(() {
        snapshot = data;
      });
    });
  }
}
