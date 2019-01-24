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
    initPlatformState();

  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      platformVersion = await Winmuplugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }


    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }
}
