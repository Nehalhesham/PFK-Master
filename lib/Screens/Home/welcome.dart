import 'package:flutter/material.dart';
import 'package:pfk/Screens/Auth/register.dart';
import 'package:pfk/Screens/Auth/sign_in.dart';
import 'package:pfk/Services/auth.dart';

class Welcome extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomPadding: false,
     body:new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("Images/greybackground.png"),
             fit: BoxFit.cover,),
          ),
        ),
         Container(
      
     margin: EdgeInsets.only(top: 125.0, bottom: 100.0,left: 90.0,right: 60.0),
     child: Image.asset('Images/skillhublogoo.png',width:200, alignment:Alignment.center)
      ,
      ),
       Container(
      
     margin: EdgeInsets.only(top: 360.0, bottom: 80.0,left: 60.0,),
    child:Text('Skill Hub', style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'bold',
                  fontSize: 60),),
      ),
        Container(
      
     margin: EdgeInsets.only(top: 450.0, bottom: 60.0,left: 60.0,right: 60.0),
    child:Text('Skill Hub is the international Hub to grow your Technology Skills',
     style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
      ),
    Container(
      
     margin: EdgeInsets.only(top: 600, bottom: 0,left:0,right: 200 ),
      child: Center(
        child:
        ButtonTheme(
  minWidth: 150.0,
  height: 50.0,
  child: 
      RaisedButton(
                  onPressed: ()  {
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
                  },
                  color: Color.fromARGB(255, 9, 51, 91),
                  child: Text(
                    "Sign In ",
                    style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'bold',
                  fontSize: 25),
                  ),
                ),
    ))),
     Container(
      
     margin: EdgeInsets.only(top: 600, bottom: 0,left:200,right: 20 ),

      child: Center(
        child:
         ButtonTheme(
  minWidth: 150.0,
  height: 50.0,
  child: 
      RaisedButton(
                  onPressed: ()  {
                      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
                  },
                  color: Color.fromARGB(255, 9, 51, 91),
                child: Text(
                    "Sign Up",
                    style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'bold',
                  fontSize: 25),
                  ),
                ),
      ) )),
      
      ],));
  }
}


