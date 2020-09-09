import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white54, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)),
  icon: const Icon(
    Icons.mail,
    color: Colors.grey,
  ),
);

