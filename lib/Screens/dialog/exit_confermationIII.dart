import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ExitConfirmationDialogIII extends StatelessWidget {
  String oldpassword='';
  String newpassword='';
     FirebaseUser users;
     GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void _changePassword(String newpass) async{
   //Create an instance of the current user. 
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    users=user;
    //Pass in the password to updatePassword.
    user.updatePassword(newpass).then((_){
      print("Succesfull changed password");
    }).catchError((error){
      print("Password can't be changed" + error.toString());
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
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
            onPressed: ()  async {
              Navigator.of(context).pop(); // dismisses only the dialog and returns nothing
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

void passwordalert(BuildContext context)async{
var passwordalert = new AlertDialog(
   title: Text(
                'Please Enter Valid Password', style: TextStyle( color: Color.fromARGB(255, 9, 51, 91),
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
      ),); await showDialog(
      context: context,
      builder: (context) => passwordalert,
    
      
      );

  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),

      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildchild(context),
    );
  }
  _buildchild(BuildContext context)=> Container(
     key: _formKey,
    height: 350,
    width: 350,
    decoration: BoxDecoration(
      color:Color.fromARGB(255, 9, 51, 91),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    child: Column(
      children: <Widget>[
        Container(
        child:Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0,0),
        child:Image.asset('Images/logopng-removebg-preview.png',height: 80,width: 60,alignment:Alignment.center),
          
        ),
        
        width: double.infinity,
         decoration: BoxDecoration(
      color:Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight:Radius.circular(12))
    ),
        ),
          
          SizedBox(height:20,),
            SizedBox(height:20,),
           Text( 'Please Enter your New Password',style: new TextStyle(
                  fontSize: 15.0,
                    
                  color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',)),
         
                SizedBox(
                  
                 
                  height: 20.0,
                ),
                TextFormField(
                  style: TextStyle(color:Colors.white),
                  decoration: InputDecoration(
                    
                    hintStyle: TextStyle(color:Colors.white),
                    hintText: 'New Password',
                    
                     enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                    
                  ),
                  validator: (val) {
                    if (val.isEmpty)
                      return "Please enter your password";
                    else if (val.length<8)
                      return "enter a valid password";
                    else
                      return null;
                  },
                  onChanged: (val) {
                    newpassword=val;
                  }
                  
                ),
           SizedBox(height:60,),
           Row(
             mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(onPressed: (){
                if(newpassword.length>=8){
                   _changePassword(newpassword);
                     Navigator.of(context, rootNavigator: true)
                  .pop();
                   
                 }
                 else{
              passwordalert(context);
            }
                 
              }
              , child: Text('Done')),

            ] 
           )
         ]
    )
  );
}