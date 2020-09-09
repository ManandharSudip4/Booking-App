import 'package:cloud_firestore/cloud_firestore.dart';

class Booki {
  final String uid;
  final String time;
  final bool status;
  final String date;
  final Timestamp endtime;

  Booki({this.uid, this.time, this.status, this.date, this.endtime});
}
