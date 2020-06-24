import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pfk/Screens/Auth/register.dart';
import 'package:pfk/Screens/Home/splashscreen.dart';
import 'package:pfk/Services/auth.dart';
import 'package:pfk/Screens/Home/home.dart';
import 'package:pfk/Screens/Home/ForgotScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  State<StatefulWidget> createState() {
    return _SignIn();
  }
}

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String email = '';
String password = '';
String error = '';

final AuthServices _auth = AuthServices();

class _SignIn extends State<SignIn> {
  @override
  final AuthServices _authServices = AuthServices();
 
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        
      // backgroundColor: Color.fromARGB(255, 253, 248, 244) ,
     
    
      body:
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
      
        child: 
        
       Form(
          

             key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                
                  children: <Widget>[
                    Container(
      
     margin: EdgeInsets.only(top: 30.0, bottom: 9.0,left: 0.0,right: 0.0),
     child: Image.asset('Images/skillhublogo-removebg-preview (1).png',width:80, alignment:Alignment.center)
      ,
      ),
                Container(
                   alignment: Alignment.center ,
                   padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                   margin: new EdgeInsets.symmetric(vertical:60.0),
                  child:
                new Text('SkillHub' ,style: new TextStyle(
                  fontSize: 47.0,
                    
                  color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',
                  
                )),)]),
                 
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                  ),
                  validator: (val) {
                    if (val.isEmpty)
                      return "Please enter an email";
                    else if (!val.contains('@') || !val.contains('.'))
                      return "enter a valid email";
                    else
                      return null;
                  },
                  onChanged: (val) {
                  
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(
                  
                 
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                    
                  ),
                  validator: (val) {
                    if (val.isEmpty)
                      return "Please enter a Password";
                    else if (val.length < 8)
                      return "enter a valid password";
                    else
                      return null;
                  },
                  obscureText: true,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result =
                   await _auth.signInWithEmailPassword(email, password);
                   
              if (result == null) {
                        setState(() {
                          error = "Authentication failed ";
                        });
                      } else {
                   Navigator.push(
                   context,
               MaterialPageRoute(builder: (context) => Splashscreen()));
                        error = '';
                        
                      }
                    }
                  },
                  color: Color.fromARGB(255, 9, 51, 91),
                  child: Text(
                    "Sign in ",
                    style: TextStyle( color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',),
                  ),
                ), 
                 SizedBox(
                  height: 12.0,
                ),
              
         
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                )
             ,
             Row(
                   children: <Widget>[
                     new Container(
                        margin: const EdgeInsets.only(left: 85.0, right: 20.0,top:0),
         
                child:InkWell(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildConext)=>ForgotScreen()));
                  },
                
                 child:Text('Forgotten Password?',  style: TextStyle(color: Colors.white, fontSize: 14.0))
                     )
                     )],
             ),

              Row(children: <Widget>[
              
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                  child: Divider(
                    color: Color.fromARGB(255,255,255, 255),
                    height: 50,
                  )),
            ),
 
           Text("OR",style: TextStyle( color: Color.fromARGB(255,255,255, 255)),),
          
 
            Expanded(
              child: new Container(
                  margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                  child: Divider(
                    color: Color.fromARGB(255,255,255, 255),
                    height: 50,
                  )),
            ),
          ]),
         Row(
               mainAxisAlignment: MainAxisAlignment.center,   crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
                FacebookSignInButton(onPressed: () async{
                     
                   await _auth.LoginWithFacebook();
                     Navigator.push(
                   context,
               MaterialPageRoute(builder: (context) => Splashscreen()));


                })
            
                         ]),
            Row(
               mainAxisAlignment: MainAxisAlignment.center,   crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 12.0),
                width: 15.0,
                height: 15.0,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(40.0)),
             
              ),
            
                
                
             Text("Don't have an account?",style: TextStyle( color: Color.fromARGB(255,255,255, 255)),),
              
             FlatButton.icon(
              onPressed: () {
               Navigator.push(
                   context,
               MaterialPageRoute(builder: (context) => Register()));
                        ;
              },
              icon: Icon(Icons.person_add),
              label: Text("Register"),textColor: Color.fromARGB(255,255,255, 255))
               ]),
                
         
            ],
            
         )),
          
      ),
      
    );
  }
}
