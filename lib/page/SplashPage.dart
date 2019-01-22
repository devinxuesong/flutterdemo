import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SplashState();
  }
}

class SplashState extends State<SplashPage> {

  Timer _timer;
  @override
  void initState(){
    super.initState();
    _timer = new Timer(const Duration(milliseconds: 1500),(){
      try{

      }catch(e){

      }
    });

  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Material(
      color: new Color.fromARGB(255, 0, 215, 198),
      child: Container(
        alignment: Alignment(0, -0.3),
        child: new Text(
          "欢迎界面",
          style: new TextStyle(
              color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold),
        ),
      ),

    );
  }
}
