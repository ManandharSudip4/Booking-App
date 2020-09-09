import 'package:firebase_login/models/bookings.dart';
import 'package:firebase_login/screens/testscreens/testbook.dart';
import 'package:firebase_login/services/bookingdb.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int selecteddate;
  String mydate() {
    var dd = DateTime.now().add(new Duration(days: selecteddate ?? 0));
    var date = dd.toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    // var timeParse = DateTime.parse(date);
    // var formattedTime = "${timeParse.hour}:${timeParse.minute}";
    // print(formattedDate);
    // print(formattedTime);
    return formattedDate;
  }

  int n = 0;
  // ignore: unused_field
  int _currentstate = 0;

  PageController _pageController = PageController();
  List<Widget> _screens = [
    Expand(1),
    Expand(2),
    Expand(3),
    Expand(4),
    Expand(4),
    Expand(6),
    Expand(7)
  ];
  void _onpagechanged(index) {
    setState(() {
      Expand(index);
      String mydate() {
        var dd = DateTime.now().add(new Duration(days: index));
        var date = dd.toString();
        var dateParse = DateTime.parse(date);
        var formattedDate =
            "${dateParse.day}-${dateParse.month}-${dateParse.year}";
        // var timeParse = DateTime.parse(date);
        // var formattedTime = "${timeParse.hour}:${timeParse.minute}";
        // print(formattedDate);
        // print(formattedTime);
        return formattedDate;
      }

      // BookingDBS.named(mydate());
      // Home.named(mydate());
      // print(mydate());
      selecteddate = index;
      // BookingDBS s1;
      // s1.setdata(mydate());
    });
  }

  @override
  Widget build(BuildContext context) {
    // final test2 = Provider.of<List<Booki>>(context);
    // test2.forEach((test) {
    //   print(test.uid);
    //   print(test.status);
    //   print(test.time);
    //   print(test.endtime);
    // });
    // print(test2);
    return MultiProvider(
      providers: [
        StreamProvider<List<Booki>>.value(
          initialData: List(),
          value: BookingDBS.named(mydate()).abc,
        ),
      ],
      child: Scaffold(
          body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onpagechanged,
      )),
    );
  }
}
