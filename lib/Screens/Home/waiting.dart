import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pfk/Screens/Home/home.dart';



class AnimatedFlutterLogo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AnimatedFlutterLogoState();

}


class _AnimatedFlutterLogoState extends State<AnimatedFlutterLogo> {
  Timer _timer;
  FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;


  _AnimatedFlutterLogoState() {
    _timer = new Timer(const Duration(milliseconds: 1500), () {
       setState(() {
        _logoStyle = FlutterLogoStyle.horizontal;
      });
    Navigator.push(                      //<-- Navigate to loginPage on Timeout
    context,
    MaterialPageRoute(builder: (context) => Home()),
  );
    });
    
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new CupertinoActivityIndicator(
      animating:true,
      radius: 50,
    
    );
     
   
  }
}

class LoginPage extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(alignment: Alignment.center,child: Text("LOG IN PAGE"));
  }
}