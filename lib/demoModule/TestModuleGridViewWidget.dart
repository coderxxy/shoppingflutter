import 'package:flutter/material.dart';

class TestModuleGridViewWidget extends StatelessWidget {
  // 参数
  late String itemTitle;
  // 初始化列表
  TestModuleGridViewWidget({super.key}) : itemTitle = "TestModuleGridViewWidget";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          itemTitle,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.lightBlueAccent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: Colors.cyanAccent.withAlpha(100),
      ),
    );
  }
}
