import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget{
  String? navItemTitle;
  Color? bgColor;
  // const AppBarWidget({super.key});
  AppBarWidget({super.key, this.navItemTitle, this.bgColor});
  Widget build(BuildContext buildContext){
    return AppBar(
      title: Text(navItemTitle ?? ""),
      backgroundColor: bgColor,
    );
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}