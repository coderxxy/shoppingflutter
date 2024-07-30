import 'package:flutter/material.dart';

class TestModuleListViewWidget extends StatelessWidget {

  final String itemTitle;
  const TestModuleListViewWidget({super.key, this.itemTitle = "TestModuleListViewWidget"});

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
    );
  }
}
