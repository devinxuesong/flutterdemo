import 'package:flutter/material.dart';
import 'dart:async';

class ChargePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChargePageState();
  }
}

class ChargePageState extends State<ChargePage> {
  final ScrollController _controller = new ScrollController();
  final TextStyle titleTextStyle = new TextStyle(fontSize: 15);
  final TextStyle subtitleStyle =
      new TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);
  var listData;
  var slideView;
  var curPage = 1;
  var listTotalSize = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
