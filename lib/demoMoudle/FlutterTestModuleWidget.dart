import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_flutter/basemodule/xy_appbar_widget.dart';
import 'package:shopping_flutter/demoMoudle/TestModuleListViewWidget.dart';

class FlutterTestModuleWidget extends StatelessWidget {
  String title;
  final List<String> _actionsTitle = ["ListView", "GridView", "Image", "button"];
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
      return Column(
        children: [
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(itemTitle),
            onTap: (){
              // 判断两个字符串是否在忽略大小写的情况下相等
              final String title = itemTitle.toLowerCase();
              if(title == "ListView".toLowerCase()){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TestModuleListViewWidget(itemTitle: "ListView")));
              }
              if(title == "GridView"){

              }
              if(title == "Image"){

              }
              if(title == "button"){

              }
              print("click $idx cell, ${_actionsTitle[idx]}");
            },
          ),
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
          return Container(
            child: Text('----分割线----'),
            color: Colors.grey
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

// ListView的创建方式有多种：
// ListView()
// ListView.builder()
// ListView.separated()
// ListView.custom()
