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
  var titles = ["我的消息", "阅读记录", "我的博客", "我的问答", "我的活动", "我的团队", "邀请好友"];
  var imagePaths = [
    "images/ic_my_message.png",
    "images/ic_my_blog.png",
    "images/ic_my_blog.png",
    "images/ic_my_question.png",
    "images/ic_discover_pos.png",
    "images/ic_my_team.png",
    "images/ic_my_recommend.png"
  ];
  final double _appBarHeight = 180.0;
  var icons = [];
  var userAvatar;
  var userName;
  var titleTextStyle = new TextStyle(fontSize: 16.0);
  var rightArrowIcon = new Image.asset(
    'images/ic_arrow_right.png',
    width: ARROW_ICON_WIDTH,
    height: ARROW_ICON_WIDTH,
  );
  final String _userHead =
      'http://a3.qpic.cn/psb?/V11GoRzM2Vse5R/*wGBFAcV4X2dSslW6P4t5w2m3Ro0BdkV.vfonfMRyjQ!/b/dCIBAAAAAAAA&ek=1&kp=1&pt=0&bo=QAZSCBAJEAwRED4!&tl=3&vuin=517367150&tm=1548144000&sce=60-2-2&rf=viewer_311';

  MyInfoPageState() {
    for (int i = 0; i < imagePaths.length; i++) {
      icons.add(getIconImage(imagePaths[i]));
    }
  }

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
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      new Expanded(
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
                ],
              ),
            ),
          ),
          new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            new Container(
              color: Colors.white,
              child: new Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: new Row(  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                 //删除
                ],),
              ),
            ),
                new Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: <Widget>[
                      new MenuItem(
                        icon: Icons.face,
                        title: '车辆管理',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '修改历史',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '修改PIN码',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '修改登陆密码',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '修改登陆密码',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '修改手机号',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '在线客服',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '在线客服',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '在线客服',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '在线客服',
                      ),
                      new MenuItem(
                        icon: Icons.face,
                        title: '在线客服',
                      ),
                    ],
                  ),
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

  //退出登陆
  _logout() async {}
}
