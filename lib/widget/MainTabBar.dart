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

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _tabController =
        new TabController(vsync: this, length: 5); // 和下面的 TabBar.tabs 数量对应
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
            Text('view 1'),
            Text('view 2'),
            Text('view 3'),
            Text('view 4'),
            Text('view 5'),
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
}
