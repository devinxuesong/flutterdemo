import 'package:flutter/material.dart';
import '../utils/Api.dart';
import '../utils/NetUtils.dart';
import 'dart:async';
import 'dart:convert';
import '../utils//Constants.dart';
import '../widget/MainTabBar.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  bool showImage = false;
  TextStyle textStyle = new TextStyle(
      color: Colors.blue,
      decoration: new TextDecoration.combine([TextDecoration.underline]));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            height: 200.0,
            color: Colors.black12,
          ),
          Expanded(child: MainTabBar())
        ],
      ),
    ));
  }

  /*获取屏幕宽度 */
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /* 获取屏幕高度 */
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
