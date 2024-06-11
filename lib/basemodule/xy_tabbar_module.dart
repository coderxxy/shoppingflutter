import 'package:flutter/material.dart';
import 'package:shopping_flutter/homeModule/xy_home_tabbarPage.dart';
import 'package:shopping_flutter/categoriesModule/xy_categories_tabbarPage.dart';
import 'package:shopping_flutter/shoppingCarModule/xy_shoppingCar_tabbarPage.dart';
import 'package:shopping_flutter/mineModule/xy_mine_tabbarPage.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _clickIdx,
        onTap: _clickTabbarAction,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.pink,
        // 当item个数超过四个时，背景色为白色，类型也会改变，使用上面的属性
        items: _tabbarItems
      ),
      body: _controllerList[_clickIdx],
    );
  }
}

