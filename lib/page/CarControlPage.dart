import 'package:flutter/material.dart';
import '../utils/Api.dart';
import '../utils/NetUtils.dart';
import 'dart:async';
import 'dart:convert';
import '../utils//Constants.dart';
import 'package:winmuplugin/winmuplugin.dart';
import 'package:flutter/services.dart';

class CarControlPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CarControlPageState();
  }
}

class CarControlPageState extends State<CarControlPage> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    //initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    print('devin  CarControlPage build');
    return new Center(
      child: new RaisedButton(onPressed: initPlatformState,
          child: new Text('跳转原生activity',style: new TextStyle(color: Colors.white))),
    );
  }

  void myPress() {}

  Future<void> initPlatformState() async {
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

  @override
  void dispose() {
    super.dispose();
    print('devin  CarControlPage dispose');
  }
}
