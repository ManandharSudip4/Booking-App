import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/models/bfc.dart';
import 'package:firebase_login/models/user.dart';
import 'package:flutter/cupertino.dart';
// import 'package:firebase_login/models/test.dart';

// create and update data starts here
class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //Collection reference
  final CollectionReference bfcCollection =
      Firestore.instance.collection('BFC');

// Update data in database
  Future updateUserData(
      String name, String position, int ratings, int age, int kitNo) async {
    return await bfcCollection.document(uid).setData({
      'name': name,
      'position': position,
      'ratings': ratings,
      'age': age,
      'kitNo': kitNo,
    });
  }

// create and update data ends here

// Add data Starts here
  Future addUserData(String name, String teamname) async {
    return await bfcCollection.document(uid).setData({
      'name': name,
      'teamname': teamname,
    });
  }

// Add data ends here

// Get data starts here
  //step 1: bfc list from snapshot (list from snapshot)
  List<BFC> _bfcListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return BFC(
        name: doc.data['name'] ?? '',
        position: doc.data['position'] ?? '',
        ratings: doc.data['rating'] ?? 0,
        age: doc.data['age'] ?? 0,
        kitNo: doc.data['kitNo'] ?? 0,
      );
    }).toList();
  }

  //setp 2:  get bfc stream (now converted list to one particular object)
  Stream<List<BFC>> get bfc {
    return bfcCollection.snapshots().map(_bfcListFromSnapshot);
  }

  // Get data ends here

  // user data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      position: snapshot.data['position'],
      ratings: snapshot.data['ratings'],
      age: snapshot.data['age'],
      kitNo: snapshot.data['kitNo'],
    );
  }

  // get user doc stream
  Stream<UserData> get userData {
    final user =
        bfcCollection.document(uid).snapshots().map(_userDataFromSnapshot);
    return user == null ? Container(width: 0.0, height: 0.0) : user;
  }

  // 1. Getdata (snapshotA) Independent
  // test to get data from the database using cloudfirestore
  Stream<QuerySnapshot> get test {
    return bfcCollection.snapshots();
  }

  // 2. List from a snapshot (converting snapshot into a list)
  List<BFC> _testlistfromss(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return BFC(
        name: doc.data['name'] ?? '',
        position: doc.data['position'] ?? '',
        ratings: doc.data['rating'] ?? 0,
        age: doc.data['age'] ?? 0,
        kitNo: doc.data['kitNo'] ?? 0,
      );
    }).toList();
  }

  // 3. from step 2
  Stream<List<BFC>> get test2 {
    return bfcCollection.snapshots().map(_testlistfromss);
  }
}
