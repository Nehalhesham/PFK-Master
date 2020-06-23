import 'package:flutter/material.dart';
import 'package:pfk/Screens/dialog/exit_confermation.dart';

class DialogHelper{


  static exit(context)=> showDialog(context: context,builder: (context)=>ExitConfirmationDialog());
}