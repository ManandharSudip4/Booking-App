import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/models/bookings.dart';
import 'package:flutter/material.dart';

class BookingDBS extends StatefulWidget {
  
  @override
  _BookingDBSState createState() => _BookingDBSState();
}
 String  abcd() {
  var dd = DateTime.now().add(new Duration(days: 0));
  var date = dd.toString();
  var dateParse = DateTime.parse(date);
  var timeParse = DateTime.parse(date);
  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
  // ignore: unused_local_variable
  var formattedTime = "${timeParse.hour}:${timeParse.minute}";
  print(formattedDate);
  // print(formattedTime);
  // print(mymydate);
  return formattedDate;
}


class _BookingDBSState extends State<BookingDBS> {
  



  

  List mymy = [1, 2, 3];

  final CollectionReference bookcollection = Firestore.instance
      .collection('Bookings')
      .document(abcd())
      .collection('Morning');

  // static var abcs;

  Future updateUserData(
      String uid, bool status, String time, Timestamp endtime) async {
    return await bookcollection.add({
      'uid': uid,
      'Status': status,
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
    return bookcollection.snapshots().map(_bookingslistfromss);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
