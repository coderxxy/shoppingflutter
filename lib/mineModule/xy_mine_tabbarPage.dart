import 'dart:ui';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

// class MemberPageWidget extends StatefulWidget {
//   const MemberPageWidget({super.key});

//   @override
//   State<MemberPageWidget> createState() => _MemberPageWidget();
// }

// class _MemberPageWidget extends State<MemberPageWidget> {
//   @override
//   void initState(){
//     super.initState();
//     // 进入页面时隐藏
//     // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//   }

//    @override
//   void dispose() {
//     // 退出页面时恢复
//     // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//     super.dispose();
//   }

// //   void setTransparentBars() {
// //     SystemChrome.setSystemUIOverlayStyle(
// //     const SystemUiOverlayStyle(
// //       statusBarColor: Colors.transparent,
// //       systemNavigationBarColor: Colors.transparent,
// //       systemNavigationBarDividerColor: Colors.transparent,
// //     ),
// //   );
// // }

//   @override
//   Widget build(BuildContext context) {
//         final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
//     return Scaffold(
//       // extendBody:true,
//       body: Center(
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               pinned: true,
//               expandedHeight: 150.0,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Image.asset(
//                     'images/mine/mine_icon_aviator.png',
//                     width: 200,
//                     height: 150,
//                     fit: BoxFit.cover,
//                   ),
//               ),
//             ),
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 childCount: items.length,
//                 (BuildContext context, int index){
//                   return Column(
//                     children: [
//                       ListTile(
//                         title: Text(
//                           items[index] + 'cell',
//                         ),
//                         onTap: (){
//                           print(items[index]+'cell');
//                         },
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           ElevatedButton(onPressed: (){}, child: const Text('全部')),
//                           const SizedBox(width: 5,),
//                           ElevatedButton(onPressed: (){}, child: const Text('未付款')),
//                           const SizedBox(width: 5,),
//                           ElevatedButton(onPressed: (){}, child: const Text('已付款')),
//                         ],
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }


class MemberPageWidget extends StatelessWidget{
  const MemberPageWidget({super.key});

  @override
  Widget build(BuildContext context){
    final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                    'images/mine/mine_icon_aviator.png',
                    width: 200,
                    height: 150,
                    fit: BoxFit.fitWidth,
                  ),
                // background: Image.network(
                //   'https://t7.baidu.com/it/u=4110758653,2063479218&fm=193&f=GIF',
                //   fit: BoxFit.cover,
                //   ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: items.length,
                (BuildContext context, int index){
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          items[index] + 'cell',
                        ),
                        onTap: (){
                          print(items[index]+'cell');
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ElevatedButton(onPressed: (){}, child: const Text('全部')),
                          const SizedBox(width: 5,),
                          ElevatedButton(onPressed: (){}, child: const Text('未付款')),
                          const SizedBox(width: 5,),
                          ElevatedButton(onPressed: (){}, child: const Text('已付款')),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}