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
/// listView
class ListViewUIWidget extends StatelessWidget {
  const ListViewUIWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),   // 左、上、右、下
    decoration: const BoxDecoration(
      // 类似 oc 的 layer
    ),
    child: ListView(
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



