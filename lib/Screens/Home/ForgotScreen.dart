import 'package:flutter/material.dart';
import 'package:pfk/Services/auth.dart';
import 'dart:ui';


class ForgotScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return _ForgotScreenState();
  }
}

class _ForgotScreenState extends State<ForgotScreen> {
  String email='';
  final _formKey = GlobalKey<FormState>();
  final AuthServices _auth = AuthServices();
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

      child:Center(
        child: Padding(padding: EdgeInsets.only(top:50,left:20,right:20),
        child:Form(
          key:_formKey,
        child:Column(
        children:<Widget>[
       Text('We Will Mail you a Link ... Please Click on it and Reser your Password', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
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
             RaisedButton(
            onPressed: ()async{
              if (_formKey.currentState.validate()) {
            dynamic result = await _auth.sendPasswordResetEmail(email) ;
              if(result == null){
                print('done');
            await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('SkillHub-me', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
        content: Text(
                'Please Check your Mail', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // dismisses only the dialog and returns nothing
            },
            child: new Text('OK', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
          ),
      ],
      ),
    );    
                           }
                                 }  },
                  color: Color.fromARGB(255, 9, 51, 91),
                  child: Text(
                    "Reset Password ",
                    style: TextStyle( color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',),
                  ),
          ), 
          ]
        ),
        )
        , 
       )
        )
      
      )  );
  }
}