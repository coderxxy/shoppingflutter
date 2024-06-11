import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AppNetworkWidget {
  static homePageNetwork() async{
    try{
      Response response;
      response = await Dio().get("http://t.weather.sojson.com/api/weather/city/101030100");
      return print('response:\n$response');
    }catch(error){
      return print('responseError:\n$error');
    }
  }
}