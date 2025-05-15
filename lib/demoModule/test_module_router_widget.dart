import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:widgets_easier/widgets_easier.dart';
import 'package:flutter_easy_animations/flutter_easy_animations.dart';

class TestModuleRouterWidget extends StatelessWidget {
  const TestModuleRouterWidget({super.key, this.title = "TestModuleRouter"});
  final String? title;

  @override
  Widget build(BuildContext context) {
    List <String>buttonTitles = ['使用 Navigator', '使用命名路由', '使用路由'];
    void clickButton(int idx, String title){
      if(kDebugMode){
        String msg = "点击了：$idx";
        print(msg);
        // LoadingAnimationWidget.twistingDots(leftDotColor: const Color(0xFF1A1A3F), rightDotColor: const Color(0xFFEA3799), size: 100);
        InfoDialogs.zoomIn(context, title: title,  message: title, buttonText: 'ok', onTapDismiss: (){
          Navigator.of(context).pop();
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.activeGreen,
        title: Title(
            color: Colors.white,
            child: Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
        ),
        centerTitle: true, // 标题居中
      ),
      body: Container(
        color: Colors.purpleAccent,
        margin: const EdgeInsets.fromLTRB(10, 20, 10, 30),
        child: Row(
          // 表示子组件在纵轴方向的对齐方式 CrossAxisAlignment.start 表示指顶部对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          // 表示row纵轴对齐方向，默认是 从上到下
          verticalDirection: VerticalDirection.down,
          children: [
            Expanded(
                child: ElevatedButton(
                  onPressed: ()=>clickButton(0, buttonTitles[0]),
                  style: ButtonStyle(
                      backgroundColor: ButtonStyleButton.allOrNull(Colors.blueAccent)
                  ),
                  child: const Text(
                    "使用 Navigator",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
            ),
            Expanded(
                child: ElevatedButton(
                  onPressed: ()=>clickButton(1, buttonTitles[1]),
                  style: ButtonStyle(
                      backgroundColor: ButtonStyleButton.allOrNull(Colors.white.withOpacity(0.5))
                  ),
                  child: const Text(
                    "使用命名路由",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
            ),
            Expanded(
                child: ElevatedButton(
                  onPressed: ()=>clickButton(2, buttonTitles[2]),
                  style: ButtonStyle(
                      backgroundColor: ButtonStyleButton.allOrNull(Colors.white.withOpacity(0.5))
                  ),
                  child: const Text(
                    "使用路由",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
