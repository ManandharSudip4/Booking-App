import 'package:firebase_login/models/user.dart';
import 'package:firebase_login/screens/home/home.dart';
import 'package:firebase_login/screens/setup/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return Authenticate();
    // return signIn();
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
