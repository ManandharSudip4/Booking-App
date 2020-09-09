import 'package:firebase_login/models/user.dart';
import 'package:firebase_login/screens/wrapper.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_login/screens/setup/signIn.dart';
// import 'package:firebase_login/screens/setup/authenticate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Demo',
        theme: ThemeData(primaryColor: Colors.green, accentColor: Colors.black),
        home: Wrapper(),
        // home: Authenticate(),
      ),
    );
  }
}
