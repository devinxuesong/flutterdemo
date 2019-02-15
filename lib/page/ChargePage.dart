import 'package:flutter/material.dart';
import '../utils/Api.dart';
import '../utils/NetUtils.dart';
import 'dart:async';
import 'dart:convert';
import '../utils//Constants.dart';
import 'package:winmuplugin/winmuplugin.dart';
import 'package:bleplugin/bleplugin.dart';
import 'package:flutter/services.dart';

class ChargePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChargePageState();
  }
}

class ChargePageState extends State<ChargePage> {
  String _platformVersion = 'Unknown';
  double opacityLevel = 1.0;

  _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    print('devin  CarControlPage build');
    return new Center(

        child: new Column(
      children: <Widget>[
        RaisedButton(
            onPressed: baiduMap,
            child: new Text('跳转原生activity',
                style: new TextStyle(color: Colors.blue))),
        RaisedButton(
            onPressed: initBle,
            child: new Text('init',
                style: new TextStyle(color: Colors.blue))),
        RaisedButton(
            onPressed: connectBle,
            child: new Text('search',
                style: new TextStyle(color: Colors.blue))),

        RaisedButton(
            onPressed: disConnectBle,
            child: new Text('conn',
                style: new TextStyle(color: Colors.blue))),

        RaisedButton(
            onPressed: platformVersion,
            child: new Text('platformVersion',
                style: new TextStyle(color: Colors.blue))),

      ],
    )

        //new RaisedButton(onPressed: baiduMap,
        //   child: new Text('跳转原生activity',style: new TextStyle(color: Colors.blue))),

        );
  }

  void myPress() {}

  //跳转map
  Future<void> baiduMap() async {
    String result;
    print('devin  CarControlPage myPress');
    try {
      result = await Winmuplugin.jumotoactivty;
    } on PlatformException {
      result = 'Failed to get jumotoactivty.';
    }

    print('devin  CarControlPage result= $result');
    if (!mounted) return;
  }

  //
  Future<void> platformVersion() async {
    String result;
    print('devin  CarControlPage platformVersion');
    try {
      result = await Bleplugin.platformVersion;
    } on PlatformException {
      result = 'Failed to get initBle.';
    }

    print('devin  CarControlPage result= $result');
    if (!mounted) return;
  }

  //
  Future<void> initBle() async {
    String result;
    print('devin  CarControlPage initBle');
    try {
      result = await Bleplugin.initBle;
    } on PlatformException {
      result = 'Failed to get initBle.';
    }

    print('devin  CarControlPage result= $result');
    if (!mounted) return;
  }

  //
  Future<void> connectBle() async {
    String result;
    print('devin  CarControlPage connectBle');
    try {
      result = await Bleplugin.connectBle;
    } on PlatformException {
      result = 'Failed to get initBle.';
    }

    print('devin  CarControlPage result= $result');
    if (!mounted) return;
  }


  //
  Future<void> disConnectBle() async {
    String result;
    print('devin  CarControlPage disConnectBle');
    try {
      result = await Bleplugin.disConnectBle;
    } on PlatformException {
      result = 'Failed to get initBle.';
    }

    print('devin  CarControlPage result= $result');
    if (!mounted) return;
  }




  @override
  void dispose() {
    super.dispose();
    print('devin  CarControlPage dispose');
  }
}
