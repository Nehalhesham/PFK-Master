import 'package:flutter/material.dart';
import 'package:pfk/Screens/Home/splashscreen.dart';
import 'package:pfk/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';

class Profile extends StatefulWidget {
  final Function toggleView;
  Profile({this.toggleView});
  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  final AuthServices _auth = AuthServices();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  String phone='';
  String name='';
  String emptyname='';
  String emptymail='';
  static String emptyphone='';

   FirebaseUser user;
  Future<String> getUserData() async{
    FirebaseUser userData= await FirebaseAuth.instance.currentUser();
    String phone ="";
    setState(() {
      
      user=userData;
     final firestoreInstance = Firestore.instance;
     firestoreInstance.collection("users").document(user.uid).get().then((value) async {
     print(value.data['displayName']);
      print(value.data['phoneNumber']);
      print('hereeeee');
      emptyphone=value.data['phoneNumber'];
      print(emptyphone);
      phone = emptyphone;
    });
      
      print(user.uid);
      print(user.email);
      print(user.displayName);
      emptyname=user.displayName;
      emptymail=user.email;
      emptyphone=phone;
      print("fkkkk " + emptyphone);
      
      
    });
    
    
  }
  @override
  void initState(){
    super.initState();
    getUserData();
    print("EMptyyyyyyyyyyyyyyyyyyy " + emptyphone  );
   
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/greybackground.png'),
            fit: BoxFit.fill,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Scaffold(
           resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
          backgroundColor: Colors.transparent, title: Text("${user.displayName}'s Profile")),
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
     child:  
     
         Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  Row(
                
                  children: <Widget>[
                    Container(
      
     margin: EdgeInsets.only(top: 20.0, bottom: 9.0,left: 0.0,right: 0.0),
     child: Image.asset('Images/skillhublogo-removebg-preview (1).png',width:80, alignment:Alignment.center)
      ,
      ),
        Container(
                   alignment: Alignment.center ,
                   padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                   margin: new EdgeInsets.symmetric(vertical:60.0),
                  child:
                new Text('SkillHub' ,style: new TextStyle(
                  fontSize: 47.0,
                    
                  color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',
                  
                )),)]),
                 SizedBox(
                  height: 20.0,
                ),
                 TextFormField (
                  decoration:new InputDecoration(
                   
                    hintText: '${user.displayName}',
                    labelText: 'User Name',
                   
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                  ), 
                  validator: (val) {
                    if (val.isEmpty)
                     name=emptyname;
                    else
                      return null;
                  },
                  
                  
                  onChanged: (val) {
                    setState(() {
                      if(val.isEmpty){
                        name=emptyname;
                        print('onchangename');
                        print(val);
                      }
                      else{
                      name = val;}
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                 TextFormField(
                  decoration: InputDecoration(
                    
                    hintText: '${user.email}',
                    labelText: 'E-Mail',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                  ), 
                  validator: (val) {
                    if (val.isEmpty)
                      email=emptymail;
                    else if (!val.contains('@') || !val.contains('.'))
                      return "Please enter a valid email";
                    else
                      return null;
                  },
                  
                  
                  onChanged: (val) {
                    setState(() {
                      if(val.isEmpty){
                        email=user.email;
                      }
                      else{
                      email = val;
                      }
                    });
                  },
                ),
                 SizedBox(
                  height: 20.0,
                ),
                 TextFormField(
                  decoration: InputDecoration(
                  
                    labelText: '${emptyphone.toString()}',
                    hintText: '${emptyphone.toString()}',
                  enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255,255,255, 255),width: 2.0)
                    )
                    
                    
                  ),
                  
                  validator: (val) {
                    if (val.isEmpty|| val == null){
                      phone=emptyphone;
                      
                    print(phone +    "  Doneeeee");
                    }
                    else if (val.length< 11 || val.length>11)
                      return "enter a valid mobile number";
                    else
                      return null;
                  },
                   onChanged: (val) {
                    setState(() {
                      if(val.isEmpty){
                        phone=emptyphone;
                      }
                      else{
                      phone = val;}
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
              RaisedButton.icon(
                  onPressed: () async {
                   if (_formKey.currentState.validate()) {
                      
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    final firestoreInstance = Firestore.instance;
     firestoreInstance.collection("users") .document(firebaseUser.uid)
        .updateData({"displayName": name,"phoneNumber":phone,"email":email }).then((_) {
          
      print("success!");
    });
    firestoreInstance.collection("users").document(firebaseUser.uid).get().then((value) async {
      print(value.data['displayName']);
      print(value.data['phoneNumber']);
      UserUpdateInfo updateInfo = UserUpdateInfo();
     updateInfo.displayName = value.data['displayName'];
      user.updateProfile(updateInfo);
      user.reload();
     
    });
    Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => Splashscreen()))
.then((_) => Home());
}},
                      
                    
                  
                  icon: Icon(
                    Icons.update,
                    color: Color.fromARGB(255, 253, 248, 244),
                  ),
                  color: Color.fromARGB(255, 9, 51, 91),
                  label: Text(
                    "Update Data ",
                    style: TextStyle(color: Color.fromARGB(255, 253, 248, 244)),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            )),
      )  ));
    
  }
}
