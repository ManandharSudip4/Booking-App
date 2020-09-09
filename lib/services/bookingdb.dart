import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/models/bookings.dart';
import 'package:firebase_login/screens/testscreens/bookings.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

String abcd() {
  var dd = DateTime.now().add(new Duration(days: 0));
  var date = dd.toString();
  var dateParse = DateTime.parse(date);
  var timeParse = DateTime.parse(date);
  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
  // ignore: unused_local_variable
  var formattedTime = "${timeParse.hour}:${timeParse.minute}";
  // print(formattedDate);
  // print(formattedTime);
  // print(mymydate);
  return formattedDate;
}

class BookingDBS {
  final Firestore _db = Firestore.instance;
  CollectionReference bookcollection;
  CollectionReference bookcollectionget;
  BookingDBS.named(this.date1) {
    bookcollectionget = _db
        .collection('Bookings')
        .document(date1 ?? abcd())
        .collection('Morning');
    // print(date1);
  }
  // void doisay() {
  //   bookcollection =
  //       _db.collection('Bookings').document(abcd()).collection('Morning');
  // }
  BookingDBS() {
    bookcollection =
        _db.collection('Bookings').document(abcd()).collection('Morning');
  }

  // CollectionReference bookcollection = Firestore.instance
  //     .collection('Bookings')
  //     .document(abcd())
  //     .collection('Morning');
  String date1;

  Future updateUserData(
      String uid, bool status, String date, String time, Timestamp endtime) async {
    return await bookcollectionget.add({
      'uid': uid,
      'Status': status,
      'date' : date,
      'Time': time,
      'EndTime': endtime,
    });
  }

  List<Booki> _bookingslistfromss(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Booki(
        uid: doc.data['uid'],
        status: doc.data['Status'],
        time: doc.data['Time'],
        endtime: doc.data['EndTime'],
      );
    }).toList();
  }

  Stream<List<Booki>> get abc {
    return bookcollectionget.snapshots().map(_bookingslistfromss) ??
        bookcollection.snapshots().map(_bookingslistfromss);
  }
}
