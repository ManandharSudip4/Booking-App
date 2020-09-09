import 'package:firebase_login/decorations/loading.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login/decorations/formfieldsdecoration.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authen = AuthService();
  String _email = '';
  String _password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Sign Up'),
              centerTitle: true,
              elevation: 10.0,
              backgroundColor: Colors.grey[900],
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(16.0),
                  child: new Form(
                    key: _formKey,
                    child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        // Logo Starts
                        new Hero(
                          tag: 'hero',
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 48.0,
                              child: Image.asset('assets/images/oo.png'),
                            ),
                          ),
                        ),
                        // Logo Ends
                        SizedBox(height: 100.0),
                        Center(
                          child: Text(
                            error,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        // Email-Input Starts
                        new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Email', fillColor: Colors.blue[50]),
                            validator: (value) => value.isEmpty
                                ? 'Email field shouln\'t be empty'
                                : null,
                            onChanged: (value) => _email = value,
                          ),
                        ),
                        // Email-Input Ends
                        // Password-Input Starts
                        new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: true,
                            autofocus: false,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password',
                                fillColor: Colors.blue[50]),
                            validator: (value) => value.length < 6
                                ? 'Password must be 6+ char long'
                                : null,
                            onChanged: (value) {
                              setState(() => _password = value);
                            },
                          ),
                        ),
                        // Password-Input Ends
                        // Sign-In Starts
                        new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: SizedBox(
                            height: 40.0,
                            child: new RaisedButton(
                                elevation: 5.0,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.blueAccent,
                                child: new Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic result = await _authen
                                        .registerWithEmailAndPassword(
                                            _email, _password);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'Please Supply valid email/password';
                                        loading = false;
                                      });

                                      print(_email);
                                      print(_password);
                                    }
                                  }
                                }),
                          ),
                        ),
                        // Sign-In Ends
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
