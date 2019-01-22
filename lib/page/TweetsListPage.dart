import 'package:flutter/material.dart';
import '../utils/Api.dart';
import '../utils/NetUtils.dart';
import 'dart:async';
import 'dart:convert';
import '../utils//Constants.dart';

class TweetsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TweetsListPageState();
  }
}

class TweetsListPageState extends State<TweetsListPage> {
  bool showImage = false;
  TextStyle textStyle = new TextStyle(
      color: Colors.blue,
      decoration: new TextDecoration.combine([TextDecoration.underline]));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Page2",style: new TextStyle(color: Colors.white)),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new Container(
                width: 1.0,
                height: 100.0,
                color: Colors.transparent,
              ),
             new Text('反反复复烦烦烦')
            ],
          ),
        ));
  }
}
