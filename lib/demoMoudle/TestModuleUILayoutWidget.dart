import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_styled_toast/flutter_styled_toast.dart';

// row 非灵活布局
class TestModuleUILayoutWidget extends StatelessWidget {
  const TestModuleUILayoutWidget({super.key});
  // click evetn
  void clickEvent (){
    // showToastWidget(const Text("Click!😊"));
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
            color: Colors.pink,
            child:const Column(
              children: [
                Text("弹性布局 Flex"),
                Row(

                ),
              ],
            ),
          ),
        ],
      ),
    );
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
