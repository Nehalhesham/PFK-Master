import 'package:flutter/material.dart';
import 'package:pfk/Screens/Auth/register.dart';
import 'package:pfk/Screens/Home/welcome.dart';
import 'package:pfk/Screens/Home/wrapper.dart';
import 'package:pfk/Services/auth.dart';
import 'package:provider/provider.dart';

import 'Models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthServices().user,
        child: MaterialApp(
          home: Wrapper(),
        
        ));
  }
}

///////////////////

