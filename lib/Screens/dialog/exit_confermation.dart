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
    height: 450,
    width: 450,
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
           child:Text('Last updated on Tuesday, June 4th, 2019 - Leave a commentA man is known by the company he keeps/ just as a tree is known by the fruit it bears. Our associates have great influence on our character. A good and virtuous man will, by the silent influence of his example, make us good, a wicked man will make us',style: TextStyle( color: Color.fromARGB(255,255, 255, 255),
                  fontFamily: 'light',
                  fontSize: 15),)),
           SizedBox(height:100,),
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