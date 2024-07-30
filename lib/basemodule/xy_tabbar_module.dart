import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_flutter/homeModule/xy_home_tabbarPage.dart';
import 'package:shopping_flutter/categoriesModule/xy_categories_tabbarPage.dart';
import 'package:shopping_flutter/shoppingCarModule/xy_shoppingCar_tabbarPage.dart';
import 'package:shopping_flutter/mineModule/xy_mine_tabbarPage.dart';
import 'package:shopping_flutter/demoMoudle/FlutterTestModuleWidget.dart';

class ShopAppTabar extends StatefulWidget{
  const ShopAppTabar({super.key});
  State<StatefulWidget> createState(){
    return ThemeAppTabbar();
  }
}

class ThemeAppTabbar extends State<ShopAppTabar>{
  int _clickIdx = 0;
  final List<Widget> _controllerList = [];
  final List<String> _titlesList = [];
  void _clickTabbarAction(int idx){
    setState((){
      _clickIdx = idx;
    });
  }
  final List<BottomNavigationBarItem> _tabbarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '首页'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.category),
        label: '分类'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: '购物车'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.card_membership),
        label: '会员中心'
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerList
    ..add(const HomePageWidget())
    ..add(const CategoriesPageWidget())
    ..add(const ShoppingCarTabbarPage())
    ..add(const MemberPageWidget());
    // TODO: titles
    _titlesList
    ..add('首页')
    ..add('分类')
    ..add('购物车')
    ..add('会员中心');
  }
  @override
  Widget build(BuildContext context) {
    // TODO: click floatButton
    void clickFloatBtn(){
      if(kDebugMode){
        print("push to test module!\n");
      }
      // TODO: push action
      FlutterTestModuleWidget testModule = FlutterTestModuleWidget();
      // testModule.title = "TestModule";
      // testModule.actionsTitle = ["Static ListView", "Dynamic ListView", "GridView"];
      Navigator.push(context, MaterialPageRoute(builder: (context) => testModule));
      // Navigator.push(context, MaterialPageRoute(builder: (context) => FlutterTestModuleWidget(title: "TestModule")));
    };
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titlesList[_clickIdx],
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.pink,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: clickFloatBtn,
        shape:const  CircleBorder(),    // 将形状设置成圆形
          child: const Icon(Icons.push_pin),
      ),
      //   floatingActionButton: Draggable(
      //     data: 'draggable',
      //     feedback: Container(
      //       width: 56.0,
      //       height: 56.0,
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
      //       ),
      //       child: Icon(Icons.push_pin, color: Theme.of(context).floatingActionButtonTheme.backgroundColor),
      //     ),
      //     childWhenDragging: Container(),
      //     child: SizedBox(
      //       width: 56,
      //       height: 56,
      //       child: FloatingActionButton(
      //         backgroundColor: Colors.green,
      //         onPressed: clickFloatBtn,
      //         shape:const  CircleBorder(),    // 将形状设置成圆形
      //         child: const Icon(Icons.push_pin),
      //       ),
      //     ),
      //   ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _clickIdx,
        onTap: _clickTabbarAction,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.pink,
        // 当item个数超过四个时，背景色为白色，类型也会改变，使用上面的属性
        items: _tabbarItems
      ),
      body: _controllerList[_clickIdx]
    );
  }
}




