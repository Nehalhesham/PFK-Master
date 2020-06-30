import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shimmer/shimmer.dart';

import 'home.dart';
String name = ""; 
class Splashscreen extends StatefulWidget {
  
 

  
  @override
  State<StatefulWidget> createState() => new _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

   Timer _timer;
    
@override
_SplashscreenState() {
_timer = new Timer(const Duration(milliseconds: 2500), () {
    while(Navigator.canPop(context)){
      Navigator.pop(context);
    }
    Navigator.push(                    
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
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child:
     Scaffold(
      body:Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[ 
          Container(
        
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'Images/greybackground.png'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
      
      
        
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
          ),
            Shimmer.fromColors( 
              baseColor: Colors.white,
              highlightColor:Color.fromARGB(255, 9, 51, 91),
              
              child:Container(
                padding: EdgeInsets.all(16.0),
                child:Text('SkillHub',style: new TextStyle(
                  fontSize: 47.0,fontFamily: 'bold',
                  shadows: <Shadow>[
                    Shadow(
                      blurRadius:18.0,
                      color: Colors.black87,
                      offset: Offset.fromDirection(120,12)
                    )
                  ])
              ))
            )],
        )
      )
    )
    ); 
   
  }
}