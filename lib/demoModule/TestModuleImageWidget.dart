import 'package:flutter/material.dart';
import 'package:shopping_flutter/untilWidget/XYStarRatingWidget.dart';

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
        alignment: Alignment.center,
        color: Colors.white.withAlpha(100),
        child: XYStarRatingWidget(rating: 1.05, count: 5),
      ),
    );
  }
}
