import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class MemberPageWidget extends StatelessWidget {
  const MemberPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List.generate(20, (index) => 'Item ${index + 1}');
    const String avatarUrl =
        'https://img1.baidu.com/it/u=1766759,3491867147&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=800';
    // 订单间隔
    const double orderPadding = 5.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              // 设置圆角
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromRGBO(253, 253, 253, 1.0), // 颜色放在这里
              ),
              padding: const EdgeInsets.all(25.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Transform.translate(
                  offset: const Offset(0, -10),
                  child: Row(
                    children: [
                      // CircleAvatar(
                      //   backgroundImage: NetworkImage(_avatarUrl),
                      // ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Stack(
                          children: [
                            Image.network(
                              avatarUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            // 向下偏移
                            Positioned(
                                top: 45,
                                // 向下偏移 45 像素
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  color: Colors.black,
                                  child: const Text(
                                    "更新",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      // backgroundColor: Colors.black
                                    ),
                                  ),
                                )),
                            // Text('更新')
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      // Transform.translate(
                      //   offset: Offset(0, -10), // x: 0（水平不偏移），y: -5（向上偏移 5 像素）
                      //   child: const Text(
                      //     '注册会员',
                      //     style:TextStyle(fontSize: 12, color: Colors.pinkAccent),
                      //   ),
                      // ),
                      const Text(
                        '注册会员',
                        style:
                            TextStyle(fontSize: 12, color: Color.fromRGBO(102, 102, 102, 1.0)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // todo: 菜单
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color.fromRGBO(253, 253, 253, 1.0), // 颜色放在这里
              ),
              padding: EdgeInsets.all(15.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: orderPadding,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => {
                                  print('待付款'),
                                },
                            icon: const ImageIcon(AssetImage(
                                'images/mine/mine_disdainful.png'))),
                        const Text(
                            '待付款',
                            style: MineOrderTextStyles.title
                        )
                      ],
                    ),
                    const SizedBox(
                      width: orderPadding,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => {
                              print('待捡货'),
                            },
                            icon: const ImageIcon(AssetImage(
                                'images/mine/mine_daijianhuo.png'))),
                        const Text(
                            '待捡货',
                            style: MineOrderTextStyles.title
                        )
                      ],
                    ),
                    const SizedBox(
                      width: orderPadding,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => {
                              print('待自提'),
                            },
                            icon: const ImageIcon(AssetImage(
                                'images/mine/mine_daiziti.png'))),
                        const Text(
                            '待自提',
                            style: MineOrderTextStyles.title
                        )
                      ],
                    ),
                    const SizedBox(
                      width: orderPadding,
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () => {
                              print('配送中'),
                            },
                            icon: const ImageIcon(AssetImage(
                                'images/mine/mine_peisong.png'))),
                        const Text(
                            '配送中',
                            style: MineOrderTextStyles.title
                        )
                      ],
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      height: 50,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    const SizedBox(width: orderPadding,),
                    Expanded(
                      child: Column(
                        children: [
                          IconButton(
                              onPressed: () => {
                                    print('我的订单'),
                                  },
                            icon: Image.asset('images/mine/mine_all_order.png'),
                            //
                              // icon: const ImageIcon(
                              //   AssetImage('images/mine/mine_all_order.png'),
                              //   color: null,
                              // )
                          ),
                          const Text(
                            '我的订单',
                            style: MineOrderTextStyles.title
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1.0),
    );
  }
}
// todo: 文字style
class MineOrderTextStyles {
  // 常规文本
  static const TextStyle normal = TextStyle(
    fontSize: 14,
    color: Colors.black,
  );

  // 标题
  static const TextStyle title = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // 强调文本
  static const TextStyle highlight = TextStyle(
    fontSize: 16,
    color: Colors.blue,
    fontWeight: FontWeight.w600,
  );
}

// todo: 扩展
extension TextStyleExtensions on TextStyle {
  // 字体加粗
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  // 设置颜色
  TextStyle withColor(Color color) => copyWith(color: color);

  // 设置字号
  TextStyle withSize(double size) => copyWith(fontSize: size);
}

// 使用
// Text('Hello',
//   style: TextStyle(fontSize: 14).bold.withColor(Colors.red)
// );

