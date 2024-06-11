import 'package:flutter/material.dart';
import 'package:shopping_flutter/networkModule/networkModule.dart';

class HomeTabbarPage extends StatelessWidget{
 @override
  Widget build(BuildContext context){
  AppNetworkWidget.homePageNetwork();
   return const Scaffold();
 }
}





// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('首页'),
//         backgroundColor: Colors.pink,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text('首页内容'),
//       ),
//     );
//   }
// }
