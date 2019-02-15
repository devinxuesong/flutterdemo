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
import 'package:rxdart/rxdart.dart';

void main() => runApp(App());

class App extends StatelessWidget {
 // final Store<int> store;
  final String title;

  App({Key key/*, this.store*/, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryIconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.light,
        primaryColor: Color.fromARGB(255, 0, 215, 198),
        accentColor: Colors.cyan[300],
      ),
      home: SplashPage(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<MyApp> {
  final appBarTitles = ['主页', '车辆', '充电桩', '我的'];
  final tabTextStyleSelected = TextStyle(color: const Color(0xff63ca6c));
  final tabTextStyleNormal = TextStyle(color: const Color(0xff969696));
  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;

  Image getTabImage(path) {
    return Image.asset(path, width: 20, height: 20);
  }

  @override
  void initState() {
    super.initState();

    DataUtils.getColorThemeIndex().then((index) {
      print('color them index= $index');
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
        Constants.eventBus
            .fire(ChangeThemeEvent(ThemeUtils.supportColors[index]));
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

  var pages = <Widget>[
    MainPage(),
    CarControlPage(),
    ChargePage(),
    MyInfoPage()
  ];

  @override
  Widget build(BuildContext contex) {
    print('devin main build $_tabIndex');

    return MaterialApp(
      theme: ThemeData(primaryColor: themeColor),
      home: Scaffold(
    /*      appBar: AppBar(
            title: Text(appBarTitles[_tabIndex],
                style: TextStyle(color: Colors.white)),
          ),*/
          body: pages[_tabIndex],
          bottomNavigationBar:
              MyBottomNavigationBar.BottomNavigationBarFullDefault(
                  onChanged: _handleTapboxChanged),
          drawer: MyDrawer()),
    );
  }
}
