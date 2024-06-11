import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_flutter/networkModule/networkModule.dart';



// class HomePageWidget extends StatelessWidget{
//   // 编辑控制器
//   final TextEditingController _editVC = TextEditingController();
//   final String _showMsg = '请放心购买...';
//
//   HomePageWidget({super.key});
//   @override
//   Widget build (BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('商店'),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             controller: _editVC,
//             decoration: const InputDecoration(
//                 contentPadding: EdgeInsets.all(20),
//                 labelText: '推荐购买',
//                 helperText: '请输入您想搜索的商品'
//             ),
//             autofocus: false,
//           ),
//           Text(
//             _showMsg,
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//           ),
//           // RaisedButton 已被弃用
//           ElevatedButton(
//               onPressed: (){
//                 if(kDebugMode){
//                   print('选中了且已提交');
//                 }
//               },
//               child: const Text('确定')
//           ),
//         ],
//       ),
//     );
//   }
// }


class HomePageWidget extends StatefulWidget{
  const HomePageWidget({super.key});
 @override
  // State<StatefulWidget> createState() => throw UnimplementedError();
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePageWidget> {
  // 编辑控制器
  final TextEditingController _editVC = TextEditingController();
  final String _showMsg = '请放心购买...';

  @override
  Widget build(BuildContext context) {

    AppNetworkWidget.homePageNetwork();

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          TextField(
            controller: _editVC,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                labelText: '推荐购买',
                // helperText: '请输入您想搜索的商品',
                hintText: '请输入您想搜索的商品'
            ),
            autofocus: false,
          ),
          Text(
            _showMsg,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          // RaisedButton 已被弃用
          ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print('选中了且已提交');
                }
              },
              child: const Text('确定')
          ),
        ],
      ),
    );
  }
}
