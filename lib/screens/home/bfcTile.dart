import 'package:flutter/material.dart';
import 'package:firebase_login/models/bfc.dart';

class BFCTile extends StatelessWidget {
  final BFC bfc;
  BFCTile({this.bfc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 5.0),
        child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25.0,
            ),
            title: Text(bfc.name),
            subtitle: Text('Position: ' + bfc.position)),
      ),
    );
  }
}
