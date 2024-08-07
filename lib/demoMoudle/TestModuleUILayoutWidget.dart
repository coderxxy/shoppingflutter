import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:shirne_dialog/shirne_dialog.dart';

// row 非灵活布局
class TestModuleUILayoutWidget extends StatelessWidget {
  const TestModuleUILayoutWidget({super.key});
  // click evetn
  void clickEvent (){
    // showToastWidget(const Text("Click!😊"));
    // MyDialog.toast("click 😊!", iconType: IconType.success);
    print('click event!\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Layout", style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Container(
            padding:const EdgeInsets.all(10.0),
            color: Colors.green,
            child: Column(
              children: [
                const Text("线形布局 Row和Column"),
                Row(
                  // 表示子组件在纵轴方向的对齐方式 CrossAxisAlignment.start 表示指顶部对齐
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // 表示row纵轴对齐方向，默认是 从上到下
                  verticalDirection: VerticalDirection.down,
                  children: [
                    // const Text(
                    //   "线形布局 Row和Column",
                    //   style: TextStyle(
                    //       color: Colors.white
                    //   ),
                    // ),
                    ElevatedButton(
                        onPressed: clickEvent,
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.redAccent,
                            textStyle: const TextStyle(
                                color: Colors.white
                            )
                        ),
                        child: const Text(
                          'Red button',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        )
                    ),
                    // 灵活布局
                    Expanded(
                      child:ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow
                        ),
                        onPressed: clickEvent,
                        child:const Text(
                          'Yellow button',
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue
                        ),
                        onPressed: clickEvent,
                        child: const Text('blue button')
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding:const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
            color: Colors.grey.withAlpha(30),
            child:const Column(
              children: [
                Text("瀑布流 Wrap"),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  alignment: WrapAlignment.center,
                  children: [
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.cyanAccent, child: Text("I")),
                      label: Text("obc"),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("J")),
                      label: Text("Java"),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.cyan, child: Text("C"),),
                      label: Text("C"),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.cyan, child: Text("C"),),
                      label: Text("C++"),
                    ),
                    Chip(
                      avatar: CircleAvatar(backgroundColor: Colors.cyan, child: Text("C")),
                      label: Text("C#"),
                    )
                  ],
                ),
              ],
            ),
            ),
          Container(
            padding:const EdgeInsets.all(5),
            color: Colors.yellowAccent,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.orange,
                  child: const Text("流式布局 Flow"),
                ),
                Flow(
                  delegate: TestModuleFlowDelegate(margin: const EdgeInsets.all(1.0)),
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.red,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.green,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.greenAccent,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.pink,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.cyan,
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.cyanAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child:Stack(
              alignment: const FractionalOffset(0.5, 0.8), // alignment属性是控制层叠的位置，建议在两个内容层叠时使用。x、y轴距离值范围 0～1
              children: [
                // CircleAvatar 组件经常用作头像，radius属性设置图片的弧度(大小，尺寸)
                const CircleAvatar(
                  // child: Image( // 本地
                  //   image: AssetImage("images/mine/mine_icon_aviator.png"),
                  //   width: 30,
                  //   height: 30,
                  //   fit: BoxFit.contain,
                  // ),
                  backgroundImage: NetworkImage("https://img0.baidu.com/it/u=293095467,155410404&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"), // 网络
                  radius: 30,
                ),
                Container(
                  decoration:BoxDecoration(
                    // color: Colors.transparent, // 设置透明色
                    color: Colors.greenAccent.withAlpha(100)
                  ),
                  padding:const EdgeInsets.all(0),
                  child:const Text(
                      "蜡笔小新",
                    style:TextStyle(
                      fontSize: 8,
                      color: Colors.green
                    ),
                  ),
                ),
              ],
            ),
          ),
           Card(
            child: Column(
              children: [
                ListTile(
                  title:const Text("aaaaaaa", style: TextStyle(fontWeight: FontWeight.w300),),
                  subtitle:const Text("aaaaaaa"),
                  leading:Icon(Icons.info, color: Colors.cyanAccent.withAlpha(150),),
                  onTap: (){
                    if (kDebugMode) {
                      print("click");
                    }
                  }
                ),
                // Divider(),
                // ListTile(
                //   title: Text("bbbbbbb", style: TextStyle(fontWeight: FontWeight.w300),),
                //   subtitle: Text("bbbbbb"),
                //   leading: Icon(Icons.account_box, color: Colors.lightBlue,),
                // ),
                // Divider(),
                // ListTile(
                //   title: Text("ccc", style: TextStyle(fontWeight: FontWeight.w300),),
                //   subtitle: Text("ccc ccc"),
                //   leading: Icon(Icons.account_box, color: Colors.lightBlue,),
                // ),
                // Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// FlowDelegate 重绘
class TestModuleFlowDelegate extends FlowDelegate{
  // 方式一
  // EdgeInsets margin = EdgeInsets.zero;
  // TestModuleFlowDelegate({required this.margin});

  // 方式二
  EdgeInsets margin;
  TestModuleFlowDelegate({this.margin = EdgeInsets.zero});

  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
    var x = margin.left;
    var y = margin.top;
    // 计算每个子widget的位置
    for(int i = 0; i < context.childCount; i ++){
      var w = context.getChildSize(i)!.width + x + margin.right;
      if(w < context.size.width){
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      }
      else{
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        // 绘制子widget
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
    // throw UnimplementedError();
  }
  @override
  Size getSize(BoxConstraints constraints) {
    // TODO: implement getSize
    // 指定 Flow的大小
    return const Size(double.infinity, 180.0);
    // return super.getSize(constraints);
  }
}

// column 列 layout
class ColumnLayoutWidget extends StatelessWidget {
  const ColumnLayoutWidget({super.key});
  // const ColumnLayoutWidget({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
