import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseService{

final String uid;
DatabaseService({this.uid});

final CollectionReference skillHub=Firestore.instance.collection('users');

Future updateUserData(String displayName,String phoneNumber) async{

return await skillHub.document(uid).setData({
  'displayName' : displayName,
  'phoneNumber': phoneNumber,}
);}


}






