import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/example/example.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DemoButtonWidget(navigationTitle: title)),
        );
      }
      if(title == "图片及icon"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DemoImageWidget(itemTitle: title)));
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
       title: const Text("BaseWidget"),
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
class _DemoStateManagerWidgetState extends State<DemoStateManagerWidget> with WidgetsBindingObserver, SingleTickerProviderStateMixin{
  late String _title;
  late String _stateMsg;
  bool _active = false;
  String _operationMsg = 'No gesture detected';
  double _top = 40.0;
  double _left = 20.0;
  static const String _imageUrl = "https://img0.baidu.com/it/u=2585600477,2703410210&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=1415";
  void _tapHandle(String msg){
    setState(() {
      _operationMsg = msg;
      if(msg.contains("单击事件")){
        _active = !_active;
      }
    });
  }
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
// 使用MediaQuery.of获取当前上下文的MediaQuery数据
    double navigationBarHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.blue,
      ),
      body:Stack(
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              onTap: ()=>_tapHandle('单击事件!'),
              onDoubleTap: ()=> _tapHandle('双击事件!'),
              onLongPress: ()=> _tapHandle('长按事件!'),
              onPanDown: (DragDownDetails e){
                setState(() {
                  // 手指按下的位置
                  print('detail:${e.globalPosition}');
                });
              },
              onPanUpdate: (DragUpdateDetails e){
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;

                  _left = (_left <= 0)?0:_left;
                  _left = (_left > (MediaQuery.of(context).size.height - 200 - MediaQuery.of(context).padding.bottom))?(MediaQuery.of(context).size.height - 200 -MediaQuery.of(context).padding.bottom):_left;
                  _top = (_top <= 0)?0:_top;
                  _top = (_top > (navigationBarHeight - 200))?(navigationBarHeight - 200):_top;

                  print('left:$_left, top:$_top');
                });
              },
              onPanEnd: (DragEndDetails e){
                // 滑动结束时 在 x、y轴上的速度
                print('velocity:${e.velocity}');
              },
              child: Container(
                // color: Colors.white, // Container的 BoxDecoration 不能和 color 同时存在
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color: _active?Colors.lightGreen:Colors.grey
                ),
                child: Center(
                  child: Text(("单击事件" == _operationMsg)? (_active?"active":"inactive"):_operationMsg),
                ),
              ),
            ),
          ),
        ],
      ),
      // body:Column(
      //   children: [
      //     const Row(
      //       children: [
      //         SizedBox(
      //           width: 10,
      //         ),
      //         Image(
      //           image: NetworkImage(_imageUrl),
      //           width: 50,
      //           height: 100,
      //           // alignment: Alignment.topCenter,
      //           fit: BoxFit.fitWidth,
      //         ),
      //         SizedBox(width: 5,),
      //         Text("beauty"),
      //       ],
      //     ),
      //     Text(
      //         _stateMsg,
      //       style: const TextStyle(
      //         color: Colors.green,
      //       ),
      //     ),
      //     const SizedBox(height: 10,),
      //   ],
      // ),
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
class DemoButtonWidget extends StatefulWidget {
  final String navigationTitle;
  const DemoButtonWidget({
    super.key,
    required this.navigationTitle
  });
  @override
  State<DemoButtonWidget> createState() => _DemoButtonWidgetState();
}
class _DemoButtonWidgetState extends State<DemoButtonWidget> {
  bool _isSelected = false;
  late String _naviTitle;

  void _clickAction() async {
    setState(() {
      _isSelected = !_isSelected;
    });
    showDialog(context: context, builder: (context){
      return AlertDialog(
          title:const Text("call moible"),
          content:const Text("Are you sure you want to dialo!"),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child:const Text("cancel")),
            TextButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child:const Text("sure")),
          ]
      );
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _naviTitle = widget.navigationTitle;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_naviTitle),
        backgroundColor: Colors.blue,
      ),
      body:Column(
        children: [
          Divider(
            height: 0.5.sp,
            color: Colors.white,
          ),
          Container(
            padding:const EdgeInsets.all(5.0),
            color: Colors.green,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center, // default
              children: [
                // SizedBox(width: 10,),
                RawMaterialButton(
                  onPressed: _clickAction,
                  elevation: 0.5,
                  fillColor: Colors.white,
                  shape: CircleBorder( // 圆角
                    side: BorderSide(
                      width: 1.sp,
                      color: const Color(0xff576b95),
                    ),
                  ),
                  padding: EdgeInsets.all(4.sp),
                  child: Icon(
                    Icons.phone_iphone,
                    size: 24.sp,
                    color: const Color.fromRGBO(87, 107, 149, 1),
                  ),
                ),
                const SizedBox(width: 0,),
                const Text("RawMaterialButton"),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            // padding: EdgeInsets.all(5.0),
            color: Colors.cyanAccent.withAlpha(100),
            child: Column(
              children: [
                MaterialButton(
                  minWidth: 48.w,
                  height: .48.w,
                  onPressed: _clickAction,
                  child: Image.asset(
                    "images/mine/mine_icon_disk@2x.png",
                    width: 32.w,
                    height: 32.w,
                    color: Colors.white,
                  ),
                ),
                const Text("MaterialButton")
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.all(5),
            color: Colors.yellow,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center, // 居中显示
              children: [
                ElevatedButton(onPressed: _clickAction, child: const Text("ElevatedButton")),
                const SizedBox(width: 10,),
                Expanded(child: FloatingActionButton(onPressed: _clickAction, child:const Text("FloatingActionButton"),),),
                const SizedBox(width: 10,),
                Expanded(child: OutlinedButton(onPressed: _clickAction, child:const Text("OutlinedButton")),),
                // OutlinedButton(onPressed: _clickAction, child:const Text("OutlinedButton")),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            padding:const EdgeInsets.all(5),
            color: Colors.lightBlueAccent,
            child: Row(
              children: [
                // Expanded(child: IconButton(onPressed: _clickAction, icon:const Icon(Icons.thumb_up))),
                IconButton(onPressed: _clickAction, icon:const Icon(Icons.thumb_up)),
                const SizedBox(width: 10,),
                TextButton(
                    onPressed: _clickAction,
                    child: Container(
                      width: 160.w,
                      height: 44.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(_isSelected?0xff576b95:0x26000000),
                          width: 1.0.w,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(22.w),
                      ),
                      child: Text(
                        "TextButton",
                        style: TextStyle(
                          color: Color(_isSelected?0xff576b95:0x26000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// TODO: 图片和icon
class DemoImageWidget extends StatelessWidget {
  final String itemTitle;
  const DemoImageWidget({
    super.key, 
    required this.itemTitle
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemTitle),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child:const Align(
          child: Image(image: NetworkImage("http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960")),
        )
      ),
    );
  }
}
// TODO: 单选开关和复选框
// TODO: 输入框和表单
// TODO: 进度指示器



