import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pfk/Models/user.dart';
import 'package:pfk/Screens/Auth/Authenticate.dart';
import 'package:pfk/Screens/Auth/register.dart';
import 'package:pfk/Screens/Auth/sign_in.dart';
import 'package:pfk/Screens/Home/home.dart';
import 'package:provider/provider.dart';
import 'package:pfk/Screens/Home/welcome.dart';


class Wrapper extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
   
    if(user == null)
   return Welcome();
   else {
     
     return Home();
   }
  }

}