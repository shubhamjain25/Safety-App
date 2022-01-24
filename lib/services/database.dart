import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safety_app/models/info.dart';
import 'package:safety_app/models/user.dart';

//brew=info

class DatabaseService {
  final String uid;
  // String name;
  // String bGroup;
  // String age;
  // String number;


  DatabaseService({this.uid});

  //collection reference
  final CollectionReference infoCollection =
  FirebaseFirestore.instance.collection('infos');

  Future updateUserData(String name, String bGroup, String age, String number) async {
    return await infoCollection
        .doc(uid)
        .set({'name': name, 'bGroup': bGroup, 'age': age, 'number': number});
  }

  List<Info> _infoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((document) {
      //print(doc.data);
      return Info(
          name: document.get('name') ?? '',
          bGroup: document.get('bGroup') ?? '',
          age: document.get('age') ?? '20',
          number: document.get('number') ?? '100');
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.get('name') ?? '',
      bGroup: snapshot.get('bGroup') ?? '',
      age: snapshot.get('age') ?? '20',
      number: snapshot.get('number') ?? '100',
    );
  }

  // UserData profileData() {
  //   return UserData(
  //     uid: uid,
  //     name: name ?? '',
  //     bGroup: bGroup ?? '',
  //     age: age ?? '20',
  //     number: number ?? '100',
  //   );
  // }

  // get infos stream
  Stream<List<Info>> get infos {
    return infoCollection.snapshots().map(_infoListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return infoCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

}
