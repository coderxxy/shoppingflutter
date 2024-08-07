import 'dart:math';

import 'package:flutter/material.dart';
class TestModuleCustomWidget extends StatelessWidget {
  const TestModuleCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestModuleCustomWidget"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        child:const CustomPainRoute(),
      ),
    );
  }
}
class CustomPainRoute extends StatelessWidget {
  const CustomPainRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size:const Size(300, 300),
        painter: MyPainter(),
      ),
    );
  }
}


class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double eW = size.width/15;
    double eH = size.height/15;
    // 绘制棋盘背景
    var paint = Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..color = const Color(0x77cdb175);
    canvas.drawRect(Offset.zero & size, paint);
    // 绘画棋盘网格
    paint
    ..style = PaintingStyle.stroke
    ..color = Colors.black87
    ..strokeWidth = 1.0;
    // 最大网格数
    int maxLineNum = 15;
    for(int i = 0; i <= maxLineNum; i ++){ // 竖线
      double dy = eH*i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
    for(int i = 0; i <= maxLineNum; i ++){
      double dx = eW * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
    // 绘制一个黑子
    paint
    ..style = PaintingStyle.fill
    ..color = Colors.black;
    canvas.drawCircle(Offset(size.width/2-eW/2, size.height/2-eH/2), min(eW/2, eH/2)-2, paint);
    // 绘制一个白子
    paint.color = Colors.white;
    canvas.drawCircle(Offset(size.width/2+eW/2, size.height/2-eH/2), min(eW/2, eH/2)-2, paint);
    // 实际场景中 正确利用此回调 可以避免重回开销，本示例中简单返回 true
    @override
    bool shouldRepaint(CustomPainter oldDelegate) => true;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
  
}
