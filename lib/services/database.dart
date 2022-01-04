import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safety_app/models/brew.dart';

//brew=info

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference infoCollection = FirebaseFirestore.instance.collection('infos');

  Future updateUserData(String bGroup, String name, int age) async{
    return await infoCollection.doc(uid).set({
      'bGroup': bGroup,
      'name': name,
      'age': age,
    });
  }

  // List<Info> _infoListFromSnapshot(QuerySnapshot snapshot){
  //   return snapshot.docs.map((doc) => {
  //     return Info(
  //       name: doc.data['name']??'',
  //       bGroup: doc.data['bGroup']??'B+',
  //       age: doc.data['age']??0
  //     );
  //   }).toList();
  // }

  //get infos stream
  // Stream<QuerySnapshot> get infos {
  //   return infoCollection.snapshots().map(__infoListFromSnapshot);
  // }



}