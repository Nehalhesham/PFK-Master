import 'package:flutter/material.dart';
import 'package:pfk/Screens/Auth/register.dart';
import 'package:pfk/Screens/Auth/sign_in.dart';
import 'package:pfk/Services/auth.dart';

class CSharp extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomPadding: false,
     body:new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("Images/greybackground.png"), fit: BoxFit.cover,),
          ),
        ),
         Container(
      
     margin: EdgeInsets.only(top: 40.0, bottom: 100.0,left: 60.0,right: 60.0),
     child: Image.asset('Images/skillhublogo-removebg-preview (1).png',width:300, alignment:Alignment.center)
      ,
      ),
       Container(
      
     margin: EdgeInsets.only(top: 370.0, bottom: 80.0,left: 60.0,),
    child:Text('Skill Hub', style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'bold',
                  fontSize: 60),),
      ),
       
    Container(
      
     margin: EdgeInsets.only(top: 650, bottom: 0,left:200,right: 0 ),
      child: Center(
        child:
        ButtonTheme(
  minWidth: 150.0,
  height: 50.0,
  child: 
      RaisedButton(
                  onPressed: ()  {
                  
                      alert(context);
                  },
                  color: Colors.red,
                  child: Text(
                    "Subscribe",
                    style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'bold',
                  fontSize: 25),
                  ),
                ),
    ))),
      
      ],));
  }
void alert(BuildContext context)async{

var alert= new AlertDialog( 
 
        title: Text(
                'Please Enter your Mobile Number', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
          content:
          SizedBox(
            height: 150,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Mobile Number',
              ),
            ),
          new FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // dismisses only the dialog and returns nothing
            },
            child: new Text('OK', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
          ),
      ]),));
      await showDialog(
      context: context,
      builder: (context) => alert,
    
      
      );
      }
  }



