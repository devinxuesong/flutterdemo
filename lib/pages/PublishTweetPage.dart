import 'package:flutter/material.dart';
import 'CommonWebPage.dart';

// "关于"页面

class PublishTweetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PublishTweetPageState();
  }
}

class PublishTweetPageState extends State<PublishTweetPage> {
  bool showImage = false;
  TextStyle textStyle = new TextStyle(
      color: Colors.blue,
      decoration: new TextDecoration.combine([TextDecoration.underline]));

  List<String> urls = new List();
  List<String> titles = new List();

  PublishTweetPageState() {
    titles.add("yubo's blog");
    titles.add("码云");
    titles.add("GitHub");
    urls.add("https://yubo725.top");
    urls.add("https://gitee.com/yubo725");
    urls.add("https://github.com/yubo725");

  }

  getLink(index) {
    String url = urls[index];
    String title = titles[index];
    return () {
      Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
        return new CommonWebPage(title: title, url: url);
      }));
    };
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("关于", style: new TextStyle(color: Colors.white)),
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
              new Image.asset(
                './images/ic_osc_logo.png',
                width: 200.0,
                height: 56.0,
              ),
              new Text("基于Google Flutter的开源中国客户端"),

            ],
          ),
        ));
  }
}
