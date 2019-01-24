import 'package:flutter/material.dart';
import './utils/ThemeUtils.dart';
import './utils/DataUtils.dart';
import './utils//Constants.dart';
import './utils/ChangeThemeEvent.dart';
import './page/ChargePage.dart';
import './page/UserInfoPage.dart';
import './page/CarControlPage.dart';
import './page/MainPage.dart';
import './page/SplashPage.dart';
import 'package:flutter/cupertino.dart';
import './widget/MyDrawer.dart';
import './widget/MyBottomNavigationBarFullDefault.dart'
    as MyBottomNavigationBar;
import 'package:redux/redux.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  final Store<int> store;
  final String title;

  App({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: new Color.fromARGB(255, 0, 215, 198),
        accentColor: Colors.cyan[300],
      ),
      home: SplashPage(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MainState();
}

class MainState extends State<MyApp> {
  final appBarTitles = ['主页', '车辆', '充电桩', '我的'];
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;
  var _body;


  var pages = <Widget>[

    new MainPage(),
    new CarControlPage(),
    new ChargePage(),
    new MyInfoPage()
  ];

  Image getTabImage(path) {
    return new Image.asset(path, width: 20, height: 20);
  }

  @override
  void initState() {
    super.initState();

    DataUtils.getColorThemeIndex().then((index) {
      print('color them index= $index');
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
        Constants.eventBus
            .fire(new ChangeThemeEvent(ThemeUtils.supportColors[index]));
      }
    });
    Constants.eventBus.on<ChangeThemeEvent>().listen((event) {
      setState(() {
        themeColor = event.color;
      });
    });
  }


  void _handleTapboxChanged(int newValue) {
    print('devin $newValue');
    setState(() {
      _tabIndex = newValue;
    });
  }

  @override
  Widget build(BuildContext contex) {
    _body = new IndexedStack(
      children: pages,
      index: _tabIndex,
    );
    return new MaterialApp(
      theme: new ThemeData(primaryColor: themeColor),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text(appBarTitles[_tabIndex]+_platformVersion,
                style: new TextStyle(color: Colors.white)),
          ),
          body: _body,
          bottomNavigationBar:
              new MyBottomNavigationBar.BottomNavigationBarFullDefault(
                  onChanged: _handleTapboxChanged),
          drawer: new MyDrawer()),
    );
  }


}
