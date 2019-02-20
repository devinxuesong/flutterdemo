import 'package:flutter/material.dart';
import '../utils/Api.dart';
import '../utils/NetUtils.dart';
import 'dart:async';
import 'dart:convert';
import '../utils//Constants.dart';
import '../widget/MainTabBar.dart';
import '../page/Pagination.dart';

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
  static const double IMAGE_INCON_HEIGHT = 22;

  Widget titleBar() {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25,top: 10,bottom: 10),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  child: Image.asset("images/main_logo_qirui.png", height: 21),
                  margin: const EdgeInsets.only(right: 7.0),
                ),
                new Container(
                  child: Image.asset("images/main_logo_jietu.png", height: 21),
                ),
              ],
            ),
          ),
          InkWell(
          //  onPressed: () {},
            child: new Image.asset("images/main_message.png", height: 22,width: 22,),

          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
          padding: EdgeInsets.only(top: getStatusBarHeight(context)),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              titleBar(),
              Pagination(),
              Expanded(child: MainTabBar())
            ],
          ),
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  colors: [Color(0xFF506891), Color(0xFF414871)]))),
    );
  }

  /*获取屏幕宽度 */
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /* 获取屏幕高度 */
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /* 获取状态高度 */
  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
