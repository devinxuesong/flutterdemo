import 'package:flutter/material.dart';

class BottomNavigationBarFullDefault extends StatefulWidget {
  final ValueChanged<int> onChanged;

  BottomNavigationBarFullDefault({Key key, @required this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _BottomNavigationBarFullDefault();
  }
}

class _BottomNavigationBarFullDefault extends State<BottomNavigationBarFullDefault> {
  int _currentIndex = 0;

  void _onItenTapped(int index) {
    widget.onChanged(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 24.0,
      currentIndex: _currentIndex,
      onTap: _onItenTapped,
      fixedColor: Colors.deepPurple,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            title: new Text("首页"), icon: new Icon(Icons.home)),
        BottomNavigationBarItem(
            title: new Text("车辆"), icon: new Icon(Icons.directions_car)),
        BottomNavigationBarItem(
            title: new Text("充电桩"), icon: new Icon(Icons.battery_charging_full)),
        BottomNavigationBarItem(
            title: new Text("我"), icon: new Icon(Icons.person)),
      ],
    );
  }
}
