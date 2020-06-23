import 'package:flutter/material.dart';
import 'package:pfk/Screens/Auth/register.dart';
import './sign_in.dart';
class Authenticate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Authicate();
  }
}

class _Authicate extends State<Authenticate> {
  bool showSignin = true;
  void toggleView() { 
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
      if(showSignin == true)
      return Container(child: SignIn(toggleView: toggleView),);
      else 
      return Container(child: Register(toggleView: toggleView),);
      
    }
    
   

    
  }

