import 'dart:ui';
import 'package:flutter/material.dart';

class TestModuleButtonWidget extends StatelessWidget {
  String title;
  TestModuleButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
