import 'package:firebase_login/models/bookings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TestList extends StatefulWidget {
  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    // // for test(snapshot) 1.
    // final test = Provider.of<QuerySnapshot>(context);
    // for (var docs in test.documents) {
    //   print(docs.data);
    // }

    // for test(list) 2.
    final test2 = Provider.of<List<Booki>>(context);
    test2.forEach((test) {
      print(test.uid);
      print(test.status);
      print(test.time);
      print(test.endtime);
    });
    // print(test2);

    return Container();
  }
}
