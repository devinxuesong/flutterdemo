import 'package:flutter/material.dart';
import '../utils/ThemeUtils.dart';
import '../utils/DataUtils.dart';
import '../widget/MenuItem.dart';

class MyInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyInfoPageState();
  }
}

class MyInfoPageState extends State<MyInfoPage> {
  Color themeColor = ThemeUtils.currentColorTheme;
  static const double ARROW_ICON_WIDTH = 30;
  static const double IMAGE_INCON_HEIGHT = 16;
  final double _appBarHeight = 180.0;


  String _userHead =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548653561973&di=e5b294834c9a5891939c8c325b702d1c&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170720%2F8b000b96022d4ce189717fe93d9e1e0a_th.jpg";

  Widget getIconImage(path) {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
      child: new Image.asset(path,
          width: IMAGE_INCON_HEIGHT, height: IMAGE_INCON_HEIGHT),
    );
  }

  @override
  void initState() {
    super.initState();
    _showUserInfo(); //刷新用户信息
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromARGB(255, 242, 242, 245),
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: _appBarHeight, //appbar的size改变
            flexibleSpace: new FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: new Stack(
                fit: StackFit.expand, //最大
                children: <Widget>[
                  const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.4),
                        colors: const <Color>[
                          const Color(0x00000000),
                          const Color(0x00000000)
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    child: new Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: new CircleAvatar(
                        radius: 35.0,
                        backgroundImage: new NetworkImage(_userHead),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            new Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(children: getMenuListItem()),
            )
          ]))
        ],
      ),
    );
  }

  //刷新用户信息
  _showUserInfo() {}

  //获取用户信息
  getUserInfo() async {}

  //显示用户详细信息
  _showUserInfoDetail() {}

  //登陆
  _login() async {}

  var _itemdata = [
    "车辆管理",
    "修改历史",
    "修改PIN码",
    "修改登陆密码",
    "修改登陆密码",
    "修改手机号",
    "在线客服",
    "在线客服",
    "在线客服",
    "在线客服",
    "在线客服",
    "在线客服",
    "在线客服",
  ];

  List<Widget> getMenuListItem() {
    List<Widget> widges = new List();
    for (int i = 0; i < _itemdata.length; i++) {
      MenuItem item = new MenuItem(icon: Icons.face, title: _itemdata[i]);
      widges.add(item);
    }
    return widges;
  }
}
