import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_flutter/basemodule/xy_appbar_widget.dart';
import 'package:shopping_flutter/demoMoudle/TestModuleButtonWidget.dart';
import 'package:shopping_flutter/demoMoudle/TestModuleCustomWidget.dart';
import 'package:shopping_flutter/demoMoudle/TestModuleGridViewWidget.dart';
import 'package:shopping_flutter/demoMoudle/TestModuleImageWidget.dart';
import 'package:shopping_flutter/demoMoudle/TestModuleListViewWidget.dart';
import 'package:shopping_flutter/demoMoudle/TestModuleUILayoutWidget.dart';

class FlutterTestModuleWidget extends StatelessWidget {
  final String title;
  final List<String> _actionsTitle = ["ListView", "GridView", "ImageWidget", "buttonWidget", "LayoutWidget", "CustomWidget"];
  final List<String> _iconsSource = [
    "images/mine/mine_icon_disk@2x.png",
    "images/mine/mine_icon_order@2x.png",
    "images/mine/mine_icon_ticket@2x.png",
    "images/mine/mine_icon_welfare@2x.png"
  ];
  // FlutterTestModuleWidget({super.key, required this.title}) : actionsTitle = [];
  final List<Widget> _cellList = [];
  // FlutterTestModuleWidget({super.key}) : title = "TestModuleWidget", actionsTitle = [];
  FlutterTestModuleWidget({super.key}) : title = "TestModuleWidget";
  @override
  Widget build(BuildContext context) {
    void clickCellAction(){
      if(kDebugMode) {
        print('click\n');
      }
    }
    // _cellList.clear();
    // for(String cellTitle in actionsTitle){
    //   ListTile cell = ListTile(leading: const Icon(Icons.star_border),title: Text(cellTitle), onTap: clickCellAction,);
    //   _cellList.add(cell);
    //   // Text text = Text(cellTitle);
    //   // _cellList.add(text);
    // }
    // TODO: cell custom
    Widget listViewCell(String itemTitle, int idx){
      String iconName = (idx >= _iconsSource.length)?_iconsSource[0]: _iconsSource[idx];
      return Column(
        children: [
          ListTile(
            // leading: const Icon(Icons.info_outline),
            leading: Image(
                image: AssetImage(iconName),
              width: 25,
              height: 25,
            ),
            title: Text(itemTitle),
            onTap: (){
              // 判断两个字符串是否在忽略大小写的情况下相等
              final String title = itemTitle.toLowerCase();
              if(title == "ListView".toLowerCase()){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TestModuleListViewWidget(itemTitle: "ListViewWidget")));
              }
              if(title == "GridView".toLowerCase()){
                TestModuleGridViewWidget gridWidget = TestModuleGridViewWidget();
                gridWidget.itemTitle = "GridViewWidget";
                Navigator.push(context, MaterialPageRoute(builder: (context) => gridWidget));
              }
              if(title.contains("ImageWidget".toLowerCase())){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TestModuleImageWidget(itemTitle: itemTitle)));
              }
              if(title.contains("button".toLowerCase())){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TestModuleButtonWidget(title: itemTitle,)));
              }
              if(title.contains("layout".toLowerCase())){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TestModuleUILayoutWidget()));
              }
              if(title.contains("custom".toLowerCase())){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TestModuleCustomWidget()));
              }
              if(kDebugMode){
                print("click $idx cell, ${_actionsTitle[idx]}");
              }
            },
          ),
          Container(
            color: Colors.red,
            height: 1.0,
          )
        ],
      );
    }

    // _cellList.clear();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          title, // 标题
          style: const TextStyle( // 标题样式 颜色 、大小
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView.separated(
          primary: true,
        scrollDirection: Axis.vertical,
        itemCount: _actionsTitle.length,
          itemBuilder: (BuildContext context, int index){
            return listViewCell(_actionsTitle[index], index);
          },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          );
        },
      ),
      // body: ListView.custom(
      //   childrenDelegate: SliverChildBuilderDelegate(
      //       (BuildContext context, int idx){
      //         return listViewCell(actionsTitle[idx], idx);
      //       },
      //     childCount: actionsTitle.length,
      //   ),
      // ),
      // body: ListView(
      //   children: _cellList,
      // ),
    );
  }
}
