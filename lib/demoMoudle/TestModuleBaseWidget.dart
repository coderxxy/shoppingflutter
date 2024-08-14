import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        Navigator.push(context, MaterialPageRoute(builder: (context) => DemoStateWidget(navTitle: title)));
      }
      if(title == "输入框和表单"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DemoTextFieldWidget(naviTitle: title)));
      }
      if(title == "进度指示器"){
        Navigator.push(context, MaterialPageRoute(builder: (ctx) =>const DemoProgressWidget()));
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
// TODO: 图片和icon 、缩放手势
class DemoImageWidget extends StatefulWidget {
  final String itemTitle;
  const DemoImageWidget({super.key, required this.itemTitle});

  @override
  State<DemoImageWidget> createState() => _DemoImageWidgetState();
}

class _DemoImageWidgetState extends State<DemoImageWidget> {
  double _width = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemTitle),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: GestureDetector(
          child: Image(image: const NetworkImage("http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960"), width: _width,),
          onScaleUpdate: (ScaleUpdateDetails detail){
            setState(() {
              _width = 200 * detail.scale.clamp(0.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}

// class DemoImageWidget extends StatelessWidget {
//   final String itemTitle;
//   const DemoImageWidget({
//     super.key,
//     required this.itemTitle
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(itemTitle),
//         backgroundColor: Colors.cyan,
//       ),
//       body: Container(
//         color: Theme.of(context).primaryColor,
//         child:const Align(
//           child: Image(image: NetworkImage("http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960")),
//         )
//       ),
//     );
//   }
// }
// TODO: 单选开关和复选框
class DemoStateWidget extends StatefulWidget {
  final String navTitle;
  const DemoStateWidget({super.key, required this.navTitle});
  @override
  State<DemoStateWidget> createState() => _DemoStateWidgetState();
}
class _DemoStateWidgetState extends State<DemoStateWidget> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  // TODO: show alert
  void showToast(bool status){
    showDialog(context: context, builder: (context){
      return AlertDialog(
          title:const Text("show status"),
          content:Text(status?"open":"close"),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.navTitle),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.grey.withAlpha(100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(
                  value: _switchSelected,
                  activeTrackColor: Colors.grey.withAlpha(100),
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.green,
                  onChanged: (value){
                    setState(() {
                      _switchSelected = value;
                      //
                      showToast(_switchSelected);
                    });
                  }),
              Checkbox(
                  activeColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  value: _checkboxSelected,
                  onChanged: (value){
                    setState(() {
                      _checkboxSelected = value!;
                      // show alert
                      showToast(_checkboxSelected);
                    });
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO: 输入框和表单
class DemoTextFieldWidget extends StatefulWidget {
  final String naviTitle;
  const DemoTextFieldWidget({super.key, required this.naviTitle});
  @override
  State<DemoTextFieldWidget> createState() => _DemoTextFieldWidgetState();
}
class _DemoTextFieldWidgetState extends State<DemoTextFieldWidget> {
  // TODO:  抽离
  EdgeInsetsGeometry paddingEdget = const EdgeInsets.only(left: 50, top: 10, right: 50);
  EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(10, 0, 10, 15);
  BoxConstraints constraintsBox = const BoxConstraints(maxHeight: 44, maxWidth: 200);
  // 定义一个controller 用于获取输入内容
  TextEditingController accountController = TextEditingController();

  FocusNode userNode = FocusNode();     // 用户名焦点
  FocusNode pwdNode = FocusNode();      // 密码焦点

  FocusNode userNode1 = FocusNode();     // 用户名焦点
  FocusNode pwdNode1 = FocusNode();      // 密码焦点

  FocusNode emailNode = FocusNode();    // 邮箱焦点
  FocusScopeNode? fsNode;

  // 表单
  GlobalKey _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> nobleGases = {
    "userNameController" : TextEditingController(),
    "pwdController" : TextEditingController(),
    "emailController" : TextEditingController(),
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.naviTitle),
        backgroundColor: Colors.cyanAccent,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.green,
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      // padding:const EdgeInsets.all(50),
                      padding:const EdgeInsets.only(left: 50, right: 50, top: 10),
                      child: ConstrainedBox(
                        constraints:const BoxConstraints(maxHeight: 250, maxWidth: 200),
                        child: TextField(
                          autofocus: true,
                          controller: accountController, // 设置controller
                          maxLength: 11,
                          style:const TextStyle(
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis, // 超出部分 显示省略号, 没什么卵用（直接截取了）
                          ),
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            contentPadding:const EdgeInsets.symmetric(vertical: 4.0),
                            hintText: "username or email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              // borderSide: BorderSide.none,
                              borderSide:const BorderSide(color: Colors.blue, width: 1.0, style: BorderStyle.solid),
                            ),
                            filled: true,
                            fillColor: const Color(0xffdcdcdc).withAlpha(150),                  //  背景色
                            prefixIcon: const Icon(Icons.person),                               //  输入框前 icon
                          ),
                          onChanged: (value){
                            if(kDebugMode){
                              print("input something:$value\n");
                            }
                          },
                          onEditingComplete: (){
                            print("用户名或邮箱:${accountController.text}\n");
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: paddingEdget,
                      child: ConstrainedBox(
                        constraints: constraintsBox,
                        child: TextField(
                          maxLines: 1,
                          style: const TextStyle(),
                          decoration: InputDecoration(
                            contentPadding:const EdgeInsets.fromLTRB(10, 0, 10, 15),
                            labelText: "密码",
                            hintText: "输入登录密码",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon:const Icon(Icons.lock),
                          ),
                          obscureText: true, // TODO: 密码脱敏
                          onChanged: (value){
                            if(kDebugMode){
                              print("密码:$value \n");
                            }
                          },
                          onEditingComplete: (){
                            print("password complete!\n");
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: paddingEdget,
                      child: ConstrainedBox(
                        constraints: constraintsBox,
                        child: TextField(
                          // 输入框的装饰器，用来修改外观
                          decoration: InputDecoration(
                            contentPadding: contentPadding,
                            labelText: "搜索",
                            hintText: "输入搜索内容",
                            labelStyle: const TextStyle(color: Colors.black),
                            fillColor:const Color(0xfffff8f4),
                            filled: true, // 如果为true，则输入使用fillColor指定的颜色填充
                            enabledBorder:const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: Colors.green, width: 0.5),
                            ),
                            focusedBorder:const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red, width: 0.5),
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.lightGreen,
                padding:const EdgeInsets.all(10),
                child:Theme(
                  data: Theme.of(context).copyWith(
                      hintColor: Colors.grey[200],
                      inputDecorationTheme:const InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                      )
                  ),
                  child:Column(
                    children:[
                      TextField(
                        focusNode: userNode,
                        decoration:const InputDecoration(
                          labelText: "用户名",
                          hintText: "输入用户名",
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: (value){
                          debugPrint("输入用户名:$value \n");
                        },
                      ),
                      TextField(
                        focusNode: pwdNode,
                        decoration:const InputDecoration(
                            labelText: "密码",
                            hintText: "输入密码",
                            hintStyle: TextStyle(
                                color: Colors.grey, fontSize: 14.0
                            ),
                            prefixIcon: Icon(Icons.lock)
                        ),
                        obscureText: true,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey.withAlpha(200),
                                  width: 0.5,
                                )
                            )
                        ),
                        child:TextField(
                          focusNode: emailNode,
                          decoration:const InputDecoration(
                            labelText: "email",
                            hintText: "输入邮箱",
                            prefixIcon: Icon(Icons.email),
                            border: InputBorder.none,       // 隐藏下划线
                          ),
                        ),
                      ),
                      Builder(builder: (ctx){
                        return Column(
                          children: [
                            ElevatedButton(
                                onPressed: (){
                                  fsNode ??= FocusScope.of(context);
                                  fsNode?.requestFocus(pwdNode);
                                },
                                child: Text("移动焦点")),
                            ElevatedButton(
                                onPressed: (){
                                  userNode.unfocus();
                                  pwdNode.unfocus();
                                  emailNode.unfocus();
                                },
                                child: Text("隐藏键盘")),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always, // 开启自动校验
                  child:Column(
                    children: [
                      TextFormField(
                        focusNode: userNode1,
                        autofocus: true,
                        decoration:const InputDecoration(
                          labelText: "用户名",
                          hintText: "输入用户名",
                          icon: Icon(Icons.person),
                        ),
                        // 校验用户名
                        validator: (v){
                          return (v!.trim().isNotEmpty) ? null : "用户名不能未空";
                        },
                      ),
                      TextFormField(
                        focusNode: pwdNode1,
                        autofocus: true,
                        decoration:const InputDecoration(
                          labelText: "密码",
                          hintText: "输入密码",
                          icon: Icon(Icons.lock),
                        ),
                        // 校验用户名
                        validator: (v){
                          return (v!.trim().isNotEmpty) ? null : "密码不能少于6位";
                        },
                      ),
                      Padding(
                        padding:const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                    onPressed: (){
                                      // 不能通过此方式获取 FormState, context 不对
                                      // 通过 _formKey.currentState 获取 FormState后，
                                      // 调用 validate() 校验用户名 密码 是否合法， 校验通过后 提交数据
                                      if((_formKey.currentState as FormState).validate()){
                                        (_formKey.currentState as FormState).save();
                                        (_formKey.currentState as FormState).reset();
                                        //
                                        userNode1.unfocus();
                                        pwdNode1.unfocus();
                                      }
                                    },
                                    child:const Text("提交"),
                                ),
                            ),
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
      ),
    );
  }
}
// class DemoTextFieldWidget extends StatelessWidget {
//   final String naviTitle;
//   const DemoTextFieldWidget({super.key, required this.naviTitle});
//   @override
//   Widget build(BuildContext context) {
//     // TODO:  抽离
//     EdgeInsetsGeometry paddingEdget = const EdgeInsets.only(left: 50, top: 10, right: 50);
//     EdgeInsetsGeometry contentPadding = const EdgeInsets.fromLTRB(10, 0, 10, 15);
//     BoxConstraints constraintsBox = const BoxConstraints(maxHeight: 44, maxWidth: 200);
//     // 定义一个controller 用于获取输入内容
//     TextEditingController accountController = TextEditingController();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(naviTitle),
//         backgroundColor: Colors.cyanAccent,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               color: Colors.green,
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Padding(
//                     // padding:const EdgeInsets.all(50),
//                     padding:const EdgeInsets.only(left: 50, right: 50, top: 10),
//                     child: ConstrainedBox(
//                       constraints:const BoxConstraints(maxHeight: 250, maxWidth: 200),
//                       child: TextField(
//                         autofocus: true,
//                         controller: accountController, // 设置controller
//                         maxLength: 11,
//                         style:const TextStyle(
//                           fontSize: 15,
//                           overflow: TextOverflow.ellipsis, // 超出部分 显示省略号, 没什么卵用（直接截取了）
//                         ),
//                         keyboardType: TextInputType.datetime,
//                         textInputAction: TextInputAction.done,
//                         decoration: InputDecoration(
//                           contentPadding:const EdgeInsets.symmetric(vertical: 4.0),
//                           hintText: "username or email",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             // borderSide: BorderSide.none,
//                             borderSide:const BorderSide(color: Colors.blue, width: 1.0, style: BorderStyle.solid),
//                           ),
//                           filled: true,
//                           fillColor: const Color(0xffdcdcdc).withAlpha(150),                  //  背景色
//                           prefixIcon: const Icon(Icons.person),                               //  输入框前 icon
//                         ),
//                         onChanged: (value){
//                           if(kDebugMode){
//                             print("input something:$value\n");
//                           }
//                         },
//                         onEditingComplete: (){
//                           print("用户名或邮箱:${accountController.text}\n");
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: paddingEdget,
//                     child: ConstrainedBox(
//                       constraints: constraintsBox,
//                       child: TextField(
//                         maxLines: 1,
//                         style: const TextStyle(),
//                         decoration: InputDecoration(
//                           contentPadding:const EdgeInsets.fromLTRB(10, 0, 10, 15),
//                           labelText: "密码",
//                           hintText: "输入登录密码",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           prefixIcon:const Icon(Icons.lock),
//                         ),
//                         obscureText: true, // TODO: 密码脱敏
//                         onChanged: (value){
//                           if(kDebugMode){
//                             print("密码:$value \n");
//                           }
//                         },
//                         onEditingComplete: (){
//                           print("password complete!\n");
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: paddingEdget,
//                     child: ConstrainedBox(
//                       constraints: constraintsBox,
//                       child: TextField(
//                         // 输入框的装饰器，用来修改外观
//                         decoration: InputDecoration(
//                           contentPadding: contentPadding,
//                           labelText: "搜索",
//                           hintText: "输入搜索内容",
//                           labelStyle: const TextStyle(color: Colors.black),
//                           fillColor:const Color(0xfffff8f4),
//                           filled: true, // 如果为true，则输入使用fillColor指定的颜色填充
//                           enabledBorder:const OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(5)),
//                             borderSide: BorderSide(color: Colors.green, width: 0.5),
//                           ),
//                           focusedBorder:const OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red, width: 0.5),
//                               borderRadius: BorderRadius.all(Radius.circular(5))
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               color: Colors.red,
//               padding:const EdgeInsets.all(10),
//               child:Theme(
//                   data: Theme.of(context).copyWith(
//                       hintColor: Colors.grey[200],
//                       inputDecorationTheme:const InputDecorationTheme(
//                         labelStyle: TextStyle(
//                           color: Colors.grey,
//                         ),
//                         hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
//                       )
//                   ),
//                   child:Column(
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: "用户名",
//                           hintText: "输入用户名",
//                           prefixIcon: Icon(Icons.person),
//                         ),
//                       ),
//                       TextField(
//                         decoration: InputDecoration(
//                           labelText: "密码",
//                           hintText: "输入密码",
//                           hintStyle: TextStyle(
//                             color: Colors.grey, fontSize: 14.0
//                           ),
//                           prefixIcon: Icon(Icons.lock)
//                         ),
//                         obscureText: true,
//                       ),
//                       Container(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             labelText: "email",
//                             hintText: "输入邮箱",
//                             prefixIcon: Icon(Icons.email),
//                             border: InputBorder.none,       // 隐藏下划线
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border(
//                             bottom: BorderSide(
//                               color: Colors.grey.withAlpha(200),
//                               width: 0.5,
//                             )
//                           )
//                         ),
//                       ),
//                     ],
//                   ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// TODO: 进度指示器
class DemoProgressWidget extends StatefulWidget {
  const DemoProgressWidget({super.key});

  @override
  State<DemoProgressWidget> createState() => _DemoProgressWidgetState();
}

class _DemoProgressWidgetState extends State<DemoProgressWidget> {

  EdgeInsetsGeometry paddingEdget = const EdgeInsets.only(left: 20, top: 10, right: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("ProgressWidget"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child:Container(
          child: Column(
            children:[
              Padding(
                padding:paddingEdget,
                child: SpinKitCircle(
                  color: Colors.black12.withAlpha(100),
                  size: 50,
                ),
              ),
              Padding(
                padding: paddingEdget,
                child:const SpinKitWave(
                  color: Colors.cyanAccent,
                  size: 50,
                ),
              ),
              Padding(
                padding: paddingEdget,
                child:const SpinKitFadingFour(
                  color: Colors.grey,
                  size: 50,
                )
              ),
              Padding(
                padding: paddingEdget,
                child:const SpinKitPulse(
                  color: Colors.blue,
                  size: 50,
                  duration: Duration(seconds: 3),
                )
              ),
              Padding(
                padding: paddingEdget,
                child:const SpinKitDualRing(color: Colors.yellow, size: 50,)
              ),
              Padding(
                padding: paddingEdget,
                child:const SpinKitRipple(color: Colors.green, size: 50,)
              ),
              Padding(
                  padding: paddingEdget,
                  child:const SpinKitPumpingHeart(color: Colors.red, size: 50,)
              ),
              Padding(
                  padding: paddingEdget,
                  child:const SpinKitChasingDots(color: Colors.black, size: 50,)
              ),
            ],
          ),
        ),
      ),
      // body: SpinKitCircle(
      //   color: Colors.black12.withAlpha(100),
      //   size: 50,
      // ),
    );
  }
}



