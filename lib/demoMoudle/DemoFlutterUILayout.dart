import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// row 非灵活布局
class LayoutRowWidget extends StatelessWidget {
  const LayoutRowWidget({super.key});
  // click evetn
  void clickEvent (){
    print('click event!\n');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ElevatedButton(
              onPressed: clickEvent,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.redAccent,
                textStyle: const TextStyle(
                  color: Colors.white
                )
              ),
              child: const Text('Red button')
          ),
          // 灵活布局
          Expanded(
            child:ElevatedButton(
              onPressed: clickEvent,
              child: const Text('Yellow button')
            ),
          ),
          ElevatedButton(
              onPressed: clickEvent,
              child: const Text('blue button')
          ),
        ],
      ),
    );
  }
}

// column 列 layout
class ColumnLayoutWidget extends StatelessWidget {
  const ColumnLayoutWidget({super.key});
  // const ColumnLayoutWidget({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
