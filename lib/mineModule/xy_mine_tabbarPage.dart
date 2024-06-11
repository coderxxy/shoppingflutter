import 'package:flutter/material.dart';

class MemberPageWidget extends StatelessWidget{
  const MemberPageWidget({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(
        child: Text('会员中心'),
      ),
      backgroundColor: Colors.blueAccent,
    );
  }
}