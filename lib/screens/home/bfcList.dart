import 'package:firebase_login/models/bfc.dart';
import 'package:firebase_login/screens/home/bfcTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BFCList extends StatefulWidget {
  @override
  _BFCListState createState() => _BFCListState();
}

class _BFCListState extends State<BFCList> {
  @override
  Widget build(BuildContext context) {
    final bfcs = Provider.of<List<BFC>>(context);
    // print(bfcs.documents);
    // bfcs.forEach((bfc) {
    //   print(bfc.name);
    //   print(bfc.position);
    //   print(bfc.age);
    //   print(bfc.kitNo);
    // });
    // return bfcs==null?Container(width: 0.0,height: 0.0,):ListView.builder(
    return ListView.builder(
      itemCount: bfcs.length,
      itemBuilder: (context, index) {
        return BFCTile(bfc: bfcs[index]);
      },
    );
  }
}
