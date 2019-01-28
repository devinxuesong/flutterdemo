import 'package:flutter/material.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar() : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainTabBarState();
  }
}

class MainTabBarState extends State<MainTabBar>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  var _itemData = [
    "信息资讯",
    "服务网点",
    "维保预约",
    "在线客服",
    "车友俱乐部",
    "车辆手册",
    "报名活动",
    "问卷调查",
    "预约试驾"
  ];

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: TabBarView(controller: _tabController, children: <Widget>[
            GridView.count(
              crossAxisCount: 2,
              primary: false,
              padding: const EdgeInsets.all(10.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 8,
              childAspectRatio: 2 / 1,
              children: buildGridTileList(6,6, 0),
            ),
            GridView.count(
              crossAxisCount: 2,
              primary: false,
              padding: const EdgeInsets.all(8.0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 8,
              childAspectRatio: 2 / 1,
              children: buildGridTileList(6,3, 1),
            ),
          ])),
          Container(
              child: new Align(
            alignment: Alignment.center,
            child: TabPageSelector(controller: _tabController),
          ))
        ],
      ),
    );
  }

  List<Widget> buildGridTileList(int numberMax,int numberCurpage, int pageIndex) {
    List<Widget> widgetList = new List();

    for (int i = 0; i < numberCurpage; i++) {
      widgetList.add(getItemWidget(numberMax, pageIndex, i));
    }

    return widgetList;
  }

  String url =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548653561973&di=e5b294834c9a5891939c8c325b702d1c&imgtype=0&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170720%2F8b000b96022d4ce189717fe93d9e1e0a_th.jpg";

  Widget getItemWidget(int numberMax, int pageIndex, int index) {

    return Card(
      child: Center(
        child: GridTile(
          child: GridTileBar(
            title: Text(_itemData[pageIndex*numberMax+index]),
            leading: Icon(Icons.ac_unit),
          ),
        ),
      ),
      //
      color: Colors.blue,
      elevation: 5.0,
    );
  }
}
