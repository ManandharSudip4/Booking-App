import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final List<String> timeList = [
    '7:00-8:00',
    '9:00-10:00',
    '12:00-13:00',
    '15:00-16:00',
    '17:00-18:00'
  ];
  final List<String> bookedTime = ['7:00-8:00', '12:00-13:00', '15:00-16:00'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: timeList
            .map((e) => Stamp(bookedTime: bookedTime, time: e))
            .toList(),
      ),
    );
  }
}

class Stamp extends StatelessWidget {
  final List<String> bookedTime;
  final String time;
  Stamp({this.bookedTime, this.time});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 10,
        ),
        RaisedButton(
          onPressed: () {
            print(time);
          },
          color: bookedTime.contains(time) ? Colors.red : Colors.green,
          child: Text(time),
        ),
      ],
    );
  }
}
