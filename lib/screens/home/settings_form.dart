import 'package:firebase_login/decorations/loading.dart';
import 'package:firebase_login/models/user.dart';
import 'package:firebase_login/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login/decorations/formfieldsdecoration.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> positions = [
    'Goal Keeper',
    'Defender',
    'Mid-Fielder',
    'Striker',
    'N/A'
  ];

  String _currentName;
  String _currentPosition;
  int _currentRating;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        //same as stream provider
        stream: DatabaseService(uid: user.uid).userData,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            print(userData.name);
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update the data',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration.copyWith(
                        icon: Icon(Icons.person), hintText: 'name'),
                    validator: (value) =>
                        value.isEmpty ? 'name field should not be empty' : null,
                    onChanged: (value) => setState(() => _currentName = value),
                  ),
                  SizedBox(height: 20.0),
                  // dropdown
                  DropdownButtonFormField(
                    decoration: textInputDecoration.copyWith(
                        icon: Icon(Icons.directions_run)),
                    value: _currentPosition ?? userData.position,
                    items: positions.map((position) {
                      return DropdownMenuItem(
                        value: position,
                        child: Text('$position'),
                      );
                    }).toList(),
                    hint: Text('Select Position'),
                    onChanged: (value) =>
                        setState(() => _currentPosition = value),
                  ),
                  // slider
                  Slider(
                    value: (_currentRating ?? userData.ratings).toDouble(),
                    activeColor:
                        Colors.blue[_currentRating ?? userData.ratings],
                    inactiveColor:
                        Colors.blue[_currentRating ?? userData.ratings],
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    onChanged: (value) =>
                        setState(() => _currentRating = value.round()),
                  ),
                  RaisedButton(
                      color: Colors.blue,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentName ?? userData.name,
                              _currentPosition ?? userData.position,
                              _currentRating ?? userData.ratings,
                              userData.age,
                              userData.kitNo);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            Loading();
          }
        });
  }
}
