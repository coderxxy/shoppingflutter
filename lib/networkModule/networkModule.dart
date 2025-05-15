import 'dart:convert';
import 'dart:math';
// import 'dart:js_interop';
import 'package:shopping_flutter/modelsModule/weather_model_widget.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AppNetworkWidget {
  final String _reqUrl = 'http://t.weather.sojson.com/api/weather/city/101210108';
  static Future<TestWeatherModel?> homePageNetwork() async{
    try{
      Response response;
      response = await Dio().get('http://t.weather.sojson.com/api/weather/city/101210108');
      if (response.data != null){
          print('response:\n $response');
          TestWeatherModel model = TestWeatherModel.fromJson(response.data);
        return model;
      }
      else{
        // throw Exception('Failed to load!');
        return null;
      }
    }catch(error){
      // throw Exception('responseError:\n$error');
      return null;
      // return print('responseError:\n$error');
    }
  }
}