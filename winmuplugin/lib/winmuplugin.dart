import 'dart:async';

import 'package:flutter/services.dart';

class Winmuplugin {
  static const MethodChannel _channel = const MethodChannel('winmuplugin');
  static const MethodChannel _channel_jump = const MethodChannel('com.winmu/jumotoactivty');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    print("devin Winmuplugin $version");
    return version;
  }

  static Future<String> get jumotoactivty async {
    Map<String, String> map = { "flutter": "原生activity" };
    String method = "TestAcitivity";
    String result = await _channel.invokeMethod(method,map);

    return result;
  }
}
