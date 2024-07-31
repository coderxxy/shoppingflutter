import 'package:flutter/material.dart';

class TestModuleImageWidget extends StatelessWidget {
  final String itemTitle;
  const TestModuleImageWidget({super.key, required this.itemTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            itemTitle,

          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 20,
            fontWeight: FontWeight.normal
          ),
        ),
        shadowColor: Colors.green,
      ),
      body: Container(
        color: Colors.pink.withAlpha(100),
      ),
    );
  }
}
