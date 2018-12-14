import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_app/model/DailyResponse.dart';
import 'package:flutter_app/api/Api.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class HttpExt {
  static void get(String url, Function callback, Function errorCallback) async {
    try {
      http.Response res = await http.get(url);
      if (callback != null) {
        callback(res.body);
      }
    } catch (exception) {
      if (errorCallback != null) {
        errorCallback(exception);
      }
    }
  }

  Future<String> getRequest(String url, [Map params]) async {
    http.Response response = await http.get(url, headers: params);
    return response.body.toString();
  }

  Future<CategoryResponse> getGankfromNet(String url) async {
    final responseStr = await getRequest(url);
    return toGankList(responseStr);
  }

  CategoryResponse toGankList(String responseStr) {
    return CategoryResponse.fromJson(jsonDecode(responseStr));
  }

  Future<Response> login(String username,String password) async{
    FormData formData = new FormData.from({
      "username":"$username",
      "password":"$password",
    });
    return await Dio().post(Api.login,data: formData);
  }

  Future<Response> register(String username,String password) async{
    FormData formData = new FormData.from({
      "username":"$username",
      "password":"$password",
      "repassword":"$password",
    });
    return await Dio().post(Api.register,data: formData);
  }
  static void post(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    try {
      http.Response res = await http.post(url, body: params);
      if (callback != null) {
        callback(res.body);
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }
}
