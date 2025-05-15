import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// private method
class Rectangle {
  num left, top, width, height;
  Rectangle(this.left, this.top, this.width, this.height);
  set right(num value) => left = value - width;
}

class Person {

  void running (){
    if (kDebugMode) {
      print('');
    }
  }
}

class Animal {
  void eat(){
    if (kDebugMode) {
      print('running');
    }
  }
}

class XiaoMing extends Person implements Animal{
  @override
  void running() {
    // TODO: implement running
    super.running();
  }
  @override
  void eat(){

  }
}
// 工厂构造函数
class Logger{
  // late final String name;
  final String name;
  bool mute = false;
  // 构建私有构造函数
  Logger._internal(this.name);
  // 工厂构造函数，这种方法每次调用会创建一次实例
  factory Logger(String name) => createInstance(name);
  static Logger createInstance(String name) => Logger._internal(name);
// 2、工厂构造函数，保存单例实例的指向
// static final Map<String, Logger> _cache = <String, Logger>{};
// factory Logger(String name){
//   return _cache.putIfAbsent(name, ()=>Logger._internal(name));
// }

// 3、创建单例 返回的都是第一次创建的实例
//     static var _singleton;
//     factory Logger(String name){
//       if(null == _singleton){
//         _singleton = Logger._internal(name);
//         return _singleton;
//       }
//     }

}
// 构造方法
class JFLogger{
  static final Map<String, JFLogger> _cache = {};
  final String name;
  JFLogger._internal(this.name);
  JFLogger(this.name){
    _cache[name] = JFLogger._internal(name);
  }
}

class JLogger{
  final String name;
  static final Map<String, JLogger> _cache = <String, JLogger>{};
  JLogger._internal(this.name);
  factory JLogger(String name){
    if(_cache.containsKey(name)){
      return _cache[name] as JLogger;
    }
    else{
      final logger = JLogger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }
}
// 抽象类
abstract class Doer{
  void doSomething();
}

class EffectiveDoer extends Doer{
  @override
  void doSomething(){ // 集成抽象类 并实现抽象方法
    if(kDebugMode){
      print('abstract');
    }
    noSuchMethod(Invocation invocation){
      if (kDebugMode) {
        print('你尝试使用一个不存在的成员:' + '${invocation.memberName}');
      }
    }
  }
}
// 隐式接口
class Person1 {
  final String _name;
  Person1(this._name);
  String greet(String who) {
    return 'Hello, $who。我是$_name';
  }
}
class Impostor implements Person1{
  @override
  get _name => '';
  @override
  String greet(String who) => 'Hello, $who。你知道我是谁么';
}

String greetBob(Person1 person) => person.greet('noBody');

// 使用mixin为类添加功能
class Performer{
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;
  void entertainMe(){
    if(canCompose){
      print("canCompose");
    }
    else if(canPlayPiano){
      print('canPlayPiano');
    }
    else if(canConduct){

    }
  }
}
// 用 关键字 on 指定 哪些类可以使用 mixin 类
mixin Musical on Performer{
  @override
  void entertainMe(){
    super.entertainMe();
    if(canCompose){
      print("canCompose");
    }
    else if(canPlayPiano){
      print('canPlayPiano');
    }
  }
}
//
class Musician extends Performer with Musical{
  @override
  late final bool canConduct;
  Musician() : canConduct = true;
  void entertainMe(){
    super.entertainMe();
  }
}

// 枚举
// 枚举不能成为 子类， 不可以mixin 不可以实现一个枚举
// 不能显式的实例化一个枚举类
enum JFColor {red, green, blue}
void colorHandle(){
  JFColor color = JFColor.red;
  List<JFColor> colorList = JFColor.values;
}

