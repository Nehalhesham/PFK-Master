import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';

import 'package:mailer/smtp_server.dart';
import 'package:mailer2/mailer.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CRM extends StatelessWidget {
FirebaseUser user;
String emaill = '';
String name='Nehal';
String phonenum='';
String phonenum2='';
String namefordialog='';

 main (String phonenumber) async{
    FirebaseUser userData= await FirebaseAuth.instance.currentUser();
   
      
      user=userData;
     final firestoreInstance = Firestore.instance;
     firestoreInstance.collection("users").document(user.uid).get().then((value) async {

      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = value.data['displayName'];
      user.updateProfile(updateInfo);
      user.reload();
     name=user.displayName;
    });
  
      
    
    
  
  print('test'+ user.displayName);
  name=user.displayName;
  emaill=user.email;
  phonenum=user.phoneNumber;
  if(phonenum=='' || phonenum==null){
    phonenum=phonenumber;
  }


  
  var options = new GmailSmtpOptions()
    ..username = 'skillhub.me@gmail.com'
    ..password = 'Hell0W0rld';  
  var emailTransport = new SmtpTransport(options);

   var envelope = new Envelope()
     
    ..from = 'skillhub.me@gmail.com'
    ..recipients.add('Bassant.Raafat@skillhub-me.com')
    ..bccRecipients.add('hidden@recipient.com')
    ..subject = 'new subscriber'
   // ..attachments.add(new Attachment(file: new File('path/to/file')))
    ..text = 'User Name: $name \nUser E-Mail: $emaill \nCourse Name: CRM \nUser Mobile Number: $phonenum';
    //..html = '<script>var name = "${name}"</script><h1>Test</h1><p><var id="name">name</var></p>';

  // Email it.
  emailTransport.send(envelope)
    .then((envelope) => print('Email sent!'))
    .catchError((e) => print('Error occurred: $e'));
 }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     resizeToAvoidBottomPadding: false,
     body:
      new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("Images/greybackground.png"), fit: BoxFit.cover,),
          ),
        ),
         Container(
      
     margin: EdgeInsets.only(top: 44.0, bottom: 200.0,left: 20.0,right: 80.0),
     child: Image.asset('Images/skillhublogoo.png',width:60)
      ,
      ),
       Container(
      
     margin: EdgeInsets.only(top: 45.0, bottom: 200.0,left: 80.0,),
    child:Text('CRM Course', style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'bold',
                  fontSize: 40),),
      ),
   Container(
      
     margin: EdgeInsets.only(top: 160.0, bottom: 0.0,left: 10.0,),
    child:Text('CRM (Customer Relationship Management).\n\nCRM Systems are everywhere in modern business, with organisations worldwide using them to store customer data, track leads and support business partner relationships.\n\nOur range of CRM training courses provides you with the skills and knowledge to use some of the world’s popular CRM systems, including Microsoft Dynamics CRM, Salesforce and Oracle.\n\nPrice of the course:5000 EGP', style: TextStyle( color: Colors.black
                  ,fontFamily: 'segoe',
                  fontSize: 20),),
      ), Container(
      
     margin: EdgeInsets.only(top: 680, bottom: 0,left:200,right: 0 ),
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
                  color: Color.fromARGB(255, 9, 51, 91),
                  child: Text(
                    "Register",
                    style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'bold',
                  fontSize: 25),
                  ),
                ),
    ))),
      
      ],));

  }
void mobilealert(BuildContext context)async{
var mobilealert = new AlertDialog(
   title: Text(
                'Please Enter your Mobile Number', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
          content:
          SizedBox(
            child:new FlatButton(
            onPressed: () async {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // dismisses only the dialog and returns nothing
            },
            child: new Text('OK', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
          ),
      ),);
      await showDialog(
      context: context,
      builder: (context) => mobilealert,
    
      
      );

  }
void thanksalert(BuildContext context)async{
   
var thanksalert = new AlertDialog(
   title: Text(
                'Thank you' , style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
          content:
          SizedBox(
            child:new FlatButton(
            onPressed: () async {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // dismisses only the dialog and returns nothing
            },
            child: new Text('OK', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
                  fontFamily: 'light',
                  fontSize: 20),),
          ),
      ),);
      await showDialog(
      context: context,
      builder: (context) => thanksalert,
    
      
      );

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
            TextFormField(
               decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: 'Mobile Number',
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                    
                  ),
                  
                 
                 
              onChanged: (val) {
                  
                      phonenum2 =val;
                  }
            ),
          new FlatButton(
            onPressed: () async {
              if (phonenum2.length==11) {
              main(phonenum2);
             print('done mail');
              Navigator.of(context, rootNavigator: true)
                  .pop();
                  thanksalert(context); // dismisses only the dialog and returns nothing
            }
            else{
              mobilealert(context);
            }},
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



