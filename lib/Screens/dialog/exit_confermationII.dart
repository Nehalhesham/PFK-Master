import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class ExitConfirmationDialogII extends StatelessWidget {
   void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
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
    height: 300,
    width: 300,
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
        child:Image.asset('Images/logopng-removebg-preview.png',height: 50,width: 60,alignment:Alignment.center),
          
        ),
        
        width: double.infinity,
         decoration: BoxDecoration(
      color:Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(topLeft:Radius.circular(12),topRight:Radius.circular(12))
    ),
        ),
          
          SizedBox(height:20,),
           Text( 'Contact Us',style: new TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',)),
           SizedBox(height: 25,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:< Widget>[
         
  FlatButton(
    onPressed: (){customLaunch('https://www.facebook.com/');},
   child: Image.asset(
   'Images/facebooklogo.png',
    fit: BoxFit.cover, // this is the solution for border
    width: 50.0,
    height: 50.0,
    
  ),
    ) 
    ,
  FlatButton(
 onPressed: (){customLaunch('mailto:nehalhesham20@gmail.com?subject=test%20subject&body=test%20body');},
   child: Image.asset(
   'Images/mail.png',
    fit: BoxFit.cover, // this is the solution for border
    width: 50.0,
    height: 50.0,
    
  ),
    )
      ,]),
       Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:< Widget>[
       FlatButton(
 onPressed:  () {
                    customLaunch('tel:+0201017605333');
                  },

   child: Image.asset(
   'Images/phonee-removebg-preview.png',
    fit: BoxFit.cover, // this is the solution for border
    width: 50.0,
    height: 50.0,
    
  ),
    )
      ,FlatButton(
 onPressed: (){
   customLaunch('https://www.google.com/maps/search/?api=1&query=30.0833217,31.276494500000002');
 },
   child: Image.asset(
   'Images/location.png',
    fit: BoxFit.cover, // this is the solution for border
    width: 50.0,
    height: 50.0,
    
  ),
    )
             ],
)               ,
           SizedBox(height:30,),
           Row(
             mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(onPressed: (){
                 Navigator.of(context).pop();
              }
              , child: Text('Close')),

            ] 
           )
         ]
    )
  );
}
