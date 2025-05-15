import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

class TestWeatherModel {
  String? message;
  int? status;
  String? date;
  String? time;
  TestWeatherCityInfoModel? cityInfo;
  TestWeatherDataModel? data;
  // 可选构造函数
  TestWeatherModel({
    this.message,
    this.status,
    this.date,
    this.time,
    this.cityInfo,
    this.data
  });

  TestWeatherModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
    cityInfo = (json['cityInfo'] != null)?TestWeatherCityInfoModel.fromJson(json['cityInfo']):null;
    data = (json['data'] != null)?TestWeatherDataModel.fromJson(json['data']):null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['date'] = date;
    data['time'] = time;
    if (this.cityInfo != null) {
      data['cityInfo'] = cityInfo?.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TestWeatherCityInfoModel {
  String? city;
  String? citykey;
  String? parent;
  String? updateTime;
  // 可选构造函数
  TestWeatherCityInfoModel({
    this.city,
    this.citykey,
    this.parent,
    this.updateTime
 });

  TestWeatherCityInfoModel.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    citykey = json['citykey'];
    parent = json['parent'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['citykey'] = citykey;
    data['parent'] = parent;
    data['updateTime'] = updateTime;
    return data;
  }
}

class TestWeatherDataModel{
  String? shidu;
  double? pm25;
  double? pm10;
  String? quality;
  String? wendu;
  String? ganmao;
  List<TestWeatherForecast>? forecast;
  TestWeatherForecast? yesterday;

  TestWeatherDataModel({
    this.shidu,
    this.pm25,
    this.pm10,
    this.quality,
    this.wendu,
    this.ganmao,
    this.forecast,
    this.yesterday
  });

  TestWeatherDataModel.fromJson(Map<String, dynamic> json) {
    shidu = json['shidu'];
    pm25 = json['pm25'];
    pm10 = json['pm10'];
    quality = json['quality'];
    wendu = json['wendu'];
    ganmao = json['ganmao'];
    if (json['forecast'] != null) {
      forecast = <TestWeatherForecast>[];
      json['forecast'].forEach((v) {
        forecast!.add(TestWeatherForecast.fromJson(v));
      });
    }
    yesterday = (json['yesterday'] != null
        ? TestWeatherForecast.fromJson(json['yesterday'])
        : null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shidu'] = this.shidu;
    data['pm25'] = this.pm25;
    data['pm10'] = this.pm10;
    data['quality'] = this.quality;
    data['wendu'] = this.wendu;
    data['ganmao'] = this.ganmao;
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.map((v) => v.toJson()).toList();
    }
    if (this.yesterday != null) {
      data['yesterday'] = this.yesterday!.toJson();
    }
    return data;
  }
}

class TestWeatherForecast {
  String? date;
  String? high;
  String? low;
  String? ymd;
  String? week;
  String? sunrise;
  String? sunset;
  int? aqi;
  String? fx;
  String? fl;
  String? type;
  String? notice;

  TestWeatherForecast(
      {this.date,
        this.high,
        this.low,
        this.ymd,
        this.week,
        this.sunrise,
        this.sunset,
        this.aqi,
        this.fx,
        this.fl,
        this.type,
        this.notice});

  TestWeatherForecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    high = json['high'];
    low = json['low'];
    ymd = json['ymd'];
    week = json['week'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    aqi = json['aqi'];
    fx = json['fx'];
    fl = json['fl'];
    type = json['type'];
    notice = json['notice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['high'] = high;
    data['low'] = low;
    data['ymd'] = ymd;
    data['week'] = week;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['aqi'] = aqi;
    data['fx'] = fx;
    data['fl'] = fl;
    data['type'] = type;
    data['notice'] = notice;
    return data;
  }
}