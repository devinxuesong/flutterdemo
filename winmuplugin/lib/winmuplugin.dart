import 'dart:async';

import 'package:flutter/services.dart';

class Winmuplugin {
  static const MethodChannel _channel =
      const MethodChannel('winmuplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    print("devin Winmuplugin $version");
    return version;
  }
}
