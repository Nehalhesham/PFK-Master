import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pfk/Models/user.dart';
import 'package:pfk/Screens/Auth/sign_in.dart';
import 'package:pfk/Screens/Home/profile.dart';
import 'package:pfk/Screens/coursesscreens/crm.dart';
import 'package:pfk/Screens/coursesscreens/crmfundmentals.dart';
import 'package:pfk/Screens/coursesscreens/pfa.dart';
import 'package:pfk/Screens/coursesscreens/pfk.dart';
import 'package:pfk/Screens/coursesscreens/sql.dart';
import 'package:pfk/Screens/dialog/dialog_helper.dart';
import 'package:pfk/Screens/dialog/dialog_helperII.dart';
import 'package:pfk/Services/auth.dart';
import 'package:pfk/Screens/Home/welcome.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:pfk/Screens/Home/courses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfk/Screens/coursesscreens/csharp.dart';

import 'ForgotScreen.dart';




String displayname='';

class Home extends StatefulWidget {
  
 
  @override
  
  final AuthServices _auth = AuthServices();
  
//String displayname="";
 
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  
  int _currentindexII=0;
  int _count=0;
  int _currentindex = 0;
  FirebaseUser user;
  Future<String> getUserData() async{
   final FirebaseUser userData= await FirebaseAuth.instance.currentUser();

    setState(() async{
      
      user=userData;
      if(user.uid==null){
        displayname=user.displayName;
      }
     else{
     final firestoreInstance = Firestore.instance;
     await firestoreInstance.collection("users").document(user.uid).get().then((value) async {
       print('here');
       displayname=user.displayName;
      print(value.data['displayName']);
      print(value.data['phoneNumber']);
      UserUpdateInfo updateInfo = UserUpdateInfo();
     updateInfo.displayName = value.data['displayName'];
     displayname=user.displayName;
     
      user.updateProfile(updateInfo);
      user.reload();
     
    });}
      
      print(user.uid);
      print(user.email);
      print(user.displayName);
      print(user.phoneNumber);
      print(displayname);
      
    });
    
    
  }
  @override
  void initState() {
    getUserData();
  
    super.initState();    
   
  }
    @override
          void dispose() {
            super.dispose();
          setState(() {
           (context as Element).reassemble();
          });
          }
  List<Courses> Course = [
    Courses(name: 'C# for beginners',descreption: 'ayhaga',image:'csharp.png'),
    Courses(name:'CRM',descreption:'ayhaga',image:'CRM.png'),
    Courses(name:'CRM Functional business',descreption:'ayhaga',image:'CRMFund.png'),
    Courses(name: 'Programing for kids',descreption: 'ayhaga',image: 'pfk.png'),
    Courses(name: 'PFA',descreption: 'ayhaga',image: 'PFA.png'),
    Courses(name: 'SQL',descreption: 'ayhaga',image: 'SQLlogo.png'),
       

   
  ];
  
  @override
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final AuthServices _auth = AuthServices();

  Widget build(BuildContext context) {
    
    var listView = ListView.builder(
      itemCount: Course.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Container(
                height: 100,
                child: Card(
                    elevation: 8.0,
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      alignment: Alignment(0, 0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(64, 75, 96, .9),
                      ),
                      child: ListTile(
                          onTap: () {
                            
                              _currentindex = index;
                          
                             if(_currentindex==0){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CSharp()));
                   }
                   else if(_currentindex==1){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CRM()));
                   }
                   else if(_currentindex==2){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CRMFun()));
                   }
                   else if(_currentindex==3){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PFK()));
                   }
                   else if(_currentindex==4){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PFA()));
                   }
                   
                   else if(_currentindex==5){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SQL()));
                   }
                            print("You clicked item number $_currentindex");
                           
                          },
                          title: Text(Course[index].name ,
                            
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'bold',
                                fontSize: 20,
                              )),
                              subtitle:  Row(
                   children: <Widget>[
                     new Container(
                        margin: const EdgeInsets.only(left: 0.0, right: 20.0,top:10),
         
                child:InkWell(
                  onTap: (){
                   _currentindexII=index;
                    if(_currentindexII==0){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CSharp()));
                   }
                   else if(_currentindexII==1){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CRM()));
                   }
                   else if(_currentindexII==2){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CRMFun()));
                   }
                   else if(_currentindexII==3){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PFK()));
                   }
                   else if(_currentindexII==4){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PFA()));
                   }
                   
                   else if(_currentindexII==5){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SQL()));
                   }
                   print('${_currentindexII}');
                  
                   
                  },
                
                 child:Text('For More Details..',  style: TextStyle(color: Colors.blue, fontSize: 14.0,decoration:TextDecoration.underline))
                     )
                     )],
             ),
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage('Images/${Course[index].image}'),
                            radius: 30,
                          ),
                        ),
                    ))));
      },
    );
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/greybackground.png'),
            fit: BoxFit.cover
          ),
          //shape: BoxShape.rectangle,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent, title: Text("Welcome,$displayname",style: new TextStyle(
                  color: Color.fromARGB(255,255,255, 255),
                  fontFamily: 'bold',))),
          body: new RefreshIndicator(
            
            child: listView,
           onRefresh: _handleRefresh,)
          ,
        
          floatingActionButton: BoomMenu(
       // child:Image.asset('Images/logo-removebg-preview.png',width:500, alignment:Alignment.center,),
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(
              size: 22.0,
              color: Color.fromARGB(255, 9, 51, 91),
              
            ),

            //child: Icon(Icons.add),
            onOpen: () => print('OPENING DIAL'),
            onClose: () => print('DIAL CLOSED'),
            overlayColor: Colors.black,
            overlayOpacity: 0.7,
            children: [
              MenuItem(
                child: Icon(Icons.person, color: Colors.white),
                title: "Profile",
                titleColor: Colors.white,
                subtitle: "You Can Check your Profile",
                subTitleColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 9, 51, 91),
                onTap: () {
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
            

                },
              ),
              MenuItem(
                child: Icon(Icons.contact_phone, color: Colors.white),
                title: "Contact Us",
                titleColor: Colors.white,
                subtitle: "You Can Contact Us",
                subTitleColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 9, 51, 91),
                onTap: () { DialogHelperII.exit(context);
            ;},
              ),
              MenuItem(
                child: Icon(Icons.supervisor_account, color: Colors.white),
                title: "About Us",
                titleColor: Colors.white,
                subtitle: "Who we are?",
                subTitleColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 9, 51, 91),
                onTap: (){
                
                  DialogHelper.exit(context);
  
                },
              ),
              MenuItem(
                child: Icon(Icons.backspace, color: Colors.white),
                title: "Logout",
                titleColor: Colors.white,
                subtitle: "Logout",
                subTitleColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 9, 51, 91),
                onTap: () {
                  _auth.signout();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Welcome()));
                },
              )
            ],
          ),
        ));}
        Future _handleRefresh() async {
            setState((){
              
                   _count+=5;
            });
            return null;
        }
  
}

 