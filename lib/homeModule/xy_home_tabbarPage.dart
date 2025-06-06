import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_flutter/networkModule/networkModule.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flukit/flukit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopping_flutter/modelsModule/weather_model_widget.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  // State<StatefulWidget> createState() => throw UnimplementedError();
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  // 编辑控制器
  final TextEditingController _editVC = TextEditingController();
  final String _showMsg = '请放心购买...';
  TestWeatherModel? weatherModel;

  @override
  void initState() {
    super.initState();
    // 请求天气数据
    _fetchWeatherData();
  }

  // todo: 获取天气
  Future<void> _fetchWeatherData() async {
    TestWeatherModel? model = await AppNetworkWidget.homePageNetwork();
    setState(() {
      weatherModel = model;
    });
    print('解析：${weatherModel!.cityInfo?.city!}');
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _imgUrls = [
      "https://img1.baidu.com/it/u=3672580894,2320729294&fm=253&fmt=auto&app=138&f=JPEG?w=852&h=500",
      'https://wx2.sinaimg.cn/large/005vUG0aly4gowhn5wjd1j31c00u0toe.jpg',
      'http://img2.baidu.com/it/u=2860001816,1136064599&fm=253&app=138&f=JPEG?w=1202&h=800'
    ];
    final mediaQueryData = MediaQuery.of(context);
    final screenW = mediaQueryData.size.width;
    final screenH = mediaQueryData.size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _editVC,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  labelText: '推荐购买',
                  // helperText: '请输入您想搜索的商品',
                  hintText: '请输入您想搜索的商品'),
              autofocus: false,
            ),
            Text(
              _showMsg,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            // RaisedButton 已被弃用
            ElevatedButton(
                onPressed: () {
                  String errMsg = '';
                  if (_editVC.text.isEmpty) {
                    errMsg = '请先输入商品';
                  } else {
                    errMsg = _editVC.text;
                  }
                  if (kDebugMode) {
                    print('选中了且已提交');
                    // alert
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(errMsg),
                        ));
                  }
                },
                child: const Text('确定')),
          ],
        ),
        Flexible(
          fit: FlexFit.tight,
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Swiper(
              indicatorAlignment: AlignmentDirectional.topEnd,
              circular: true,
              autoStart: true,
              indicator: NumberSwiperIndicator(),
              children: AspecRaticImgs(
                  _imgUrls, screenW, ScreenUtil().setHeight(screenW * 0.50)),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '${weatherModel?.cityInfo!.parent!}:${weatherModel?.cityInfo!.city!},\n 当天温度：${weatherModel?.data!.wendu},\n 湿度：${weatherModel?.data!.shidu}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class NumberSwiperIndicator extends SwiperIndicator {
  @override
  Widget build(BuildContext context, int index, int itemCount) {
    if (itemCount > 1) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
        margin: const EdgeInsets.only(top: 10.0, right: 5.0),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text(
          "${++index}/$itemCount",
          style: const TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      );
    } else {
      return Container();
    }
  }
}

List<Widget> AspecRaticImgs(
    List<String> imgUrl, double imgWidth, double imgHeight) {
  return imgUrl.map<Widget>((url) {
    return CachedNetworkImage(
      imageUrl: url,
      height: imgHeight,
      width: imgWidth,
      fit: BoxFit.cover,
      // placeholder: Custom,
      // errorWidget: Image.asset('images/bg_gray.png', height: 200),
    );
  }).toList();
}
