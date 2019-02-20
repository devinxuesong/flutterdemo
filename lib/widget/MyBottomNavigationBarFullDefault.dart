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

class _BottomNavigationBarFullDefault
    extends State<BottomNavigationBarFullDefault> {
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
      type: BottomNavigationBarType.shifting,
      iconSize: 24.0,
      currentIndex: _currentIndex,
      onTap: _onItenTapped,
      fixedColor: Colors.deepPurple,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            title: Text("车生活",style: TextStyle(fontSize: 0),),
            icon: Image.asset(
              "images/navi_bar_life_sel.png",
              width: 92,
              height: 56,
            ),
            backgroundColor: Color(0xFF506891)),
        BottomNavigationBarItem(
            title: Text("我的爱车",style: TextStyle(fontSize: 0)),
            icon: Image.asset(
              "images/navi_bar_car_nor.png",
              width: 92,
              height: 56,
            ),
            backgroundColor: Color(0xFF506891)),
        BottomNavigationBarItem(
          title: Text("车辆控制",style: TextStyle(fontSize: 0)),
          icon: Image.asset(
            "images/navi_bar_control_nor.png",
            width: 92,
            height: 56,
          ),
          backgroundColor: Color(0xFF506891),
          //   activeIcon:new Image.asset('images/main_message.png'),
        ),
        BottomNavigationBarItem(
            title: Text("我的",style: TextStyle(fontSize: 0)),
            icon: Image.asset(
              "images/navi_bar_my_nor.png",
              width: 92,
              height: 56,
            ),
            backgroundColor: Color(0xFF506891)),
      ],
    );
  }
}
