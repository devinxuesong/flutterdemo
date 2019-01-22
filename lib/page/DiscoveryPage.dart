import 'package:flutter/material.dart';
import 'dart:async';

class DiscoveryPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new DiscoveryPageState();
  }
}

class DiscoveryPageState extends State<DiscoveryPage> {
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
    _controller.addListener(() {
      var maxSroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxSroll == pixels && listData.length < listTotalSize) {
        curPage++;

      }
    });

  }

  Future<Null> _pullToRefesh() async {
    curPage = 1;

    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listView = new ListView.builder(
        itemCount: listData.length * 2,
        //  itemBuilder: (context, i) => renderRow(i),
        controller: _controller,
      );
      return new RefreshIndicator(child: listView, onRefresh: _pullToRefesh);
    }
  }


}