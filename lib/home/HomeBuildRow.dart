import 'package:flutter/material.dart';
import 'package:flutter_app/model/DailyResponse.dart';
import 'package:flutter_app/home/HomeBanner.dart';

Widget buildHomeBannerRow(context, postData){
   List<PostData> banner = new List();

   if(postData!=null){
     for(var value in postData){
       banner.add(PostData.fromJson(value));
     }
   }
   return new HomeBanner(banner, 200.0);
}