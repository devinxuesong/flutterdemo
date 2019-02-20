import 'package:flutter/material.dart';

class ThemeUtils{
  //默认主题颜色
  static const Color defaultColor = const Color(0xFF506891);
  //可选的主题颜色
  static const List<Color> supportColors = [defaultColor, Colors.purple, Colors.orange, Colors.deepPurpleAccent, 
    Colors.redAccent, Colors.blue, Colors.amber, Colors.green, Colors.lime, Colors.indigo, Colors.cyan, Colors.teal];

  //当前的主题颜色
  static Color currentColorTheme = defaultColor;

}