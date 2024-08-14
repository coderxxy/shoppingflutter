import 'package:flutter/material.dart';

class XYStarRatingWidget extends StatefulWidget {

  final int count;            // 个数
  final double rating;        // 分数
  final double maxRating;     // 最大分数
  final Color norColor;       // 未选中颜色
  final Color selectedColor;  // 选中颜色
  final double size;             // 大小

  final Icon norImage;
  final Icon selectImage;

// 构造方法
  XYStarRatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.norColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    norImage,
    selectImage
  }) : norImage = norImage??Icon(Icons.star_border, color:norColor, size:size),
        selectImage = selectImage??Icon(Icons.star, color:selectedColor, size:size);

  @override
  State<XYStarRatingWidget> createState() => _XYStarRatingWidgetState();
}

class _XYStarRatingWidgetState extends State<XYStarRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnSelectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStar(),
        ),
      ],
    );
  }

  // 方法抽离 TODO: 未选中星
  List<Widget> buildUnSelectedStar(){
    return List.generate(widget.count, (index){
      return widget.norImage;//Icon(Icons.star_border, color: widget.norColor, size: widget.size);
    });
  }
  // 选中 TODO: 选中星
List<Widget> buildSelectedStar(){
    List<Widget> stars = [];
    double oneValue = widget.maxRating / widget.count;
    final star = widget.selectImage;//Icon(Icons.star, color:  widget.selectedColor, size: widget.size);
    int entireCount = (widget.rating / oneValue).floor();  // floor() 向下取整
    for(var i = 0; i < entireCount; i ++){
      stars.add(star);
    }
//  构建部分填充star
    double leftW = ((widget.rating / oneValue) - entireCount) * widget.size;
    final partStar = ClipRect(
      clipper: XYStarClipper(leftW),
      child: star,
    );
    stars.add(partStar);
    return stars;
}

List<Widget> buildStar(bool selected, int count){
    return List.generate(count, (index){
      return Icon(selected?Icons.star:Icons.star_border, color: selected?widget.selectedColor:widget.norColor, size: widget.size);
    });
}
  // end
}

// todo: 裁剪辅助类
class XYStarClipper extends CustomClipper<Rect>{
  final double width;
  const XYStarClipper(this.width);
  @override
  Rect getClip(Size size){
    return Rect.fromLTRB(0, 0, width, size.height);
  }
  @override
  bool shouldReclip(XYStarClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.width != width;
  }
}

