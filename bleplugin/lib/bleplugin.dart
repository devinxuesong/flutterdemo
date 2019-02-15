import 'dart:async';

import 'package:flutter/services.dart';

class Bleplugin {
  static const MethodChannel _channel =
      const MethodChannel('bleplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static Future<String> get initBle async {
    final String version = await _channel.invokeMethod('initBle');
    return version;
  }


  static Future<String> get connectBle async {
    final String version = await _channel.invokeMethod('connectBle');
    return version;
  }

  static Future<String> get disConnectBle async {
    final String version = await _channel.invokeMethod('disConnectBle');
    return version;
  }


  static Future<String> get distroy async {
    final String version = await _channel.invokeMethod('distroy');
    return version;
  }


}
