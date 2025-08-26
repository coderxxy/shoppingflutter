import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TestModuleContainerWidget extends StatelessWidget {
  const TestModuleContainerWidget({super.key, this.title = "TestModuleContainerWidget"});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.activeOrange,
        title: Title(
          color: Colors.white,
          child: Text(
            title!,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ),
        centerTitle: true, // 标题居中
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 120.0),
        constraints: const BoxConstraints.tightFor(width: 200, height: 150), // 卡片尺寸
        decoration: const BoxDecoration(  // 背景装饰
          gradient: RadialGradient(
            colors: [Colors.red, Colors.orange],
            center: Alignment.topLeft,
            radius: .98,
          ),
          boxShadow: [ //卡片阴影
            BoxShadow(
              color: Colors.black12,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
            )
          ],
        ),
        transform: Matrix4.rotationZ(.2), // 卡片倾斜变换
        alignment: Alignment.center,  // 卡片内文字居中
        child: const Text(
          "07.07",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0
          ),
        ),
      ),
    );
  }
}
