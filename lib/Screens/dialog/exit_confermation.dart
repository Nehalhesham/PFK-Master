import 'package:flutter/material.dart';


class ExitConfirmationDialog extends StatelessWidget {
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
    height: 560,
    width: 500,
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
           Text( 'Who We are ?',style: new TextStyle(
                  fontSize: 20.0,
                    
                  color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',)),
           SizedBox(height: 10,),
           Padding(
           padding:const EdgeInsets.only(left:16,right:16),
           child:Text("Skill Hub is a fast growing Technology company based in Egypt with presence in the Middle East, we are specialized in Technology Services focusing on 4 main areas: Consultancy, Projects,Outsourcing and Training. \n\nWe provide Training courses for:\n1. Microsoft Dynamics CRM Basics\n2. Microsoft Dynamics CRM Advanced\n\nOur mission is supporting our customers through providing excellent service with enterprise class.. \nSkill Hub We're with you wherever you are.",style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'light',
                  fontSize: 17),)),
           SizedBox(height:60,),
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