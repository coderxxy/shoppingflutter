import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// ImageRepeat.repeat   横向、纵向进行重复，直到铺满整个画布
/// ImageRepeat.repeatX  横向重复
/// ImageRepeat.repeatY  纵向重复
///
class ImageUIWidget extends StatelessWidget {
  const ImageUIWidget({super.key});
  @override
  Widget build(BuildContext context)  => Container(
    child: Image.network(
      'http://img1.baidu.com/it/u=3106733293,1060690595&fm=253&app=138&f=JPEG?w=800&h=1120',
      scale: 1.0,
      fit: BoxFit.cover,
      repeat: ImageRepeat.repeat,         // 图片重复属性
      colorBlendMode: BlendMode.lighten,  // 颜色混合模式
    ),
  );
}
/// 静态 listView 写静态功能页面
class ListViewUIWidget extends StatelessWidget {
  const ListViewUIWidget({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),   // 左、上、右、下
    decoration: const BoxDecoration(
      // 类似 oc 的 layer
    ),
    child: ListView(
      scrollDirection: Axis.vertical, // default: Axis.vertical
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text('access_time'),
        ),
        ListTile(
          leading: Icon(Icons.account_balance),
          title: Text('account_balance'),
        ),
      ],
    ),
  );
}
// 动态 listview
class ListViewDyWidget extends StatelessWidget {
  final List<String> items;
  const ListViewDyWidget({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context, idx){
          return ListTile(
            title: Text('$idx'),
          );
        }
    );
  }
}
// GridView
class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
      crossAxisSpacing: 10,
      children: const [
        Text('coderxxy'),
        Text('coderxxy'),
        Text('coderxxy'),
      ],
    );
  }
}




