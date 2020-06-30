import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pfk/Screens/Auth/sign_in.dart';
import 'package:pfk/Screens/Home/splashscreen.dart';
import 'package:pfk/Services/auth.dart';
import 'package:pfk/Screens/Auth/sign_in.dart';
import 'package:pfk/Screens/Home/waiting.dart';

import 'package:pfk/Screens/Home/home.dart';
import 'package:splashscreen/splashscreen.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  String phone='';
  String name='';

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
      
     margin: EdgeInsets.only(top: 35.0, bottom: 9.0,left: 0.0,right: 0.0),
     child: Image.asset('Images/skillhublogoo.png',width:80, alignment:Alignment.center)
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
                  height: 20.0,
                ),
                 TextFormField(
                  decoration: InputDecoration(
                    
                    hintText: 'User Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                  ), 
                  validator: (val) {
                    if (val.isEmpty)
                      return "Please enter a User Name";
                    else
                      return null;
                  },
                  
                  
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
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
                      return "Please enter a valid email";
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
                    hintText: 'Mobile Numer',
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                    
                  ),
                  
                  validator: (val) {
                    if (val.isEmpty)
                      return "Please enter Mobile Number";
                    else if (val.length< 11)
                      return "enter a valid mobile number";
                    else
                      return null;
                  },
                   onChanged: (val) {
                    setState(() {
                      phone = val;
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
              RaisedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      
                      dynamic result = await _auth.registerWithEmailPassword(
                          email, password,name,phone);
                          
                      if (result == null) {
                        setState(() {
                          error = "Please enter a valid email";
                        });
                      }
                      else { 
                        error ='';
                   
                        Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => Splashscreen()))
.then((_) => Home());
               
                      }
                    }
                  },
                  icon: Icon(
                    Icons.person_add,
                    color: Color.fromARGB(255, 253, 248, 244),
                  ),
                  color: Color.fromARGB(255, 9, 51, 91),
                  label: Text(
                    "Register ",
                    style: TextStyle(color: Color.fromARGB(255, 253, 248, 244)),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            )),
      ));
    
  }
}
