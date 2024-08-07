import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@immutable
class TestModuleBaseWidget extends StatelessWidget {
  TestModuleBaseWidget({super.key});
  final List<String> _widgetSource = ["状态管理", "按钮", "图片及icon", "单选开关和复选框", "输入框和表单", "进度指示器"];
  @override
  Widget build(BuildContext context) {
    //
    void didSelectCellWithIdx(int idx){
      String title = _widgetSource[idx];
      if(title == "状态管理"){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DemoStateManagerWidget(itemTitle: title)
            )
        );
      }
      if(title == "按钮"){

      }
      if(title == "图片及icon"){

      }
      if(title == "单选开关和复选框"){

      }
      if(title == "输入框和表单"){

      }
      if(title == "进度指示器"){

      }
    }
    // TODO: cellWithIndex
    Widget cellWithIndex(int idx){
      return Column(
        children: [
          ListTile(
            iconColor: Colors.blue,
            leading: const Icon(Icons.check_box), // icon
            title: Text(_widgetSource[idx]),      // textLabel
            onTap: (){
              didSelectCellWithIdx(idx);
            },
          ),
          Divider(
            color: Colors.grey.withAlpha(50),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
       title: Text("BaseWidget"),
       backgroundColor: Colors.blue, 
      ),
      body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate((context, index){
            return cellWithIndex(index);
          },
        childCount: _widgetSource.length // 设置显示的cell数
      )),
    );
  }
}
// TODO: 状态管理
class DemoStateManagerWidget extends StatefulWidget {
  final String itemTitle;
  // 构造方法
  const DemoStateManagerWidget({
    super.key,
    required this.itemTitle,
  });
  @override
  State<DemoStateManagerWidget> createState() => _DemoStateManagerWidgetState();
}
class _DemoStateManagerWidgetState extends State<DemoStateManagerWidget> with WidgetsBindingObserver{
  late String _title;
  late String _stateMsg;
  static const String _imageUrl = "https://img0.baidu.com/it/u=2585600477,2703410210&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1415";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = widget.itemTitle;
    _stateMsg = AppLifecycleState.resumed.toString();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    // 实时刷新状态显示到页面
    setState(() {
      _stateMsg = state.toString();
    });
    print("app状态:${state.toString()}""state:$_stateMsg");
    switch(state){
      case AppLifecycleState.inactive:  // 处于这种状态的应用程序 应该假设它们可能在任何时候暂停
      break;
      case AppLifecycleState.resumed:   // 从后台切换到前台，界面可见
        break;
      case AppLifecycleState.paused:    // 界面不可见。后台
        break;
      case AppLifecycleState.detached:  // app结束时调用
        // TODO: Handle this case.
        break;
      case AppLifecycleState.hidden:    // default
        // TODO: Handle this case.
        break;
    }
  }
  //
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.blue,
      ),
      body:const SizedBox(
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image(
              image: NetworkImage(_imageUrl),
              width: 50,
              height: 100,
              // alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(width: 5,),
            Text("beauty"),
          ],
        ),
      ),
      // body:Align(
      //   alignment: Alignment.center,//Alignment.bottomCenter,
      //   child: Text(_stateMsg),
      // ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    //  移除监听
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}


Future<Size> getImageDimensions(String imageUrl) async {
  // 创建一个ImageProvider
  final ImageProvider provider = NetworkImage(imageUrl);
  // 完成图片加载的Completer
  final Completer<Size> completer = Completer<Size>();
  // 定义图片加载监听器
  final ImageStreamListener listener = ImageStreamListener(
        (ImageInfo info, bool synchronousCall) {
      // 图片加载完成，获取图片的宽度和高度
      final ImageSize = Size(
        info.image.width.toDouble(),
        info.image.height.toDouble(),
      );
      // 完成completer
      completer.complete(ImageSize);
    },
    onError: (exception, stackTrace) {
      // 图片加载失败，完成completer并传递异常
      completer.completeError(exception, stackTrace);
    },
  );

  // 获取图片的ImageStream
  final ImageStream stream = provider.resolve(const ImageConfiguration());

  // 为ImageStream添加监听器
  stream.addListener(listener);

  // 返回Future，将在图片加载完成或发生错误时完成
  return completer.future;
}



// TODO: 按钮
// TODO: 图片和icon
// TODO: 单选开关和复选框
// TODO: 输入框和表单
// TODO: 进度指示器



