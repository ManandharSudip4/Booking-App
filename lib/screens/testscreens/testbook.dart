import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:firebase_login/models/bookings.dart';
import 'package:provider/provider.dart';
import 'package:firebase_login/services/bookingdb.dart';

class Expand extends StatefulWidget {
  Expand(this.i) {
    print(i);
  }
  final int i;
  @override
  _ExpandState createState() => _ExpandState();
}

class _ExpandState extends State<Expand> {
  String mydate() {
    var dd = DateTime.now().add(new Duration(days: widget.i - 1));
    var date = dd.toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    // var timeParse = DateTime.parse(date);
    // var formattedTime = "${timeParse.hour}:${timeParse.minute}";
    // print(formattedDate);
    // print(formattedTime);
    return formattedDate;
  }

  // final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  // final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    final test2 = Provider.of<List<Booki>>(context);
    test2.forEach((test) {
      // print(test.uid);
      // print(test.status);
      // print(test.date);
      // print(test.endtime);
    });
    // Counter for no. of free hours
    String counter(dynamic tester) {
      int count = 0;
      for (var j in tester) {
        if (j.status == true) {
          count += 1;
        }
      }
      return count.toString();
    }
    // Counter ends here

    List morningdb = [];
    test2.forEach((element) {
      morningdb.add(element.time);
    });
    // print(morningdb);
    List morningTime = ['6-7', '7-8', '8-9', '9-10', '10-11', '11-12'];
    // print(morningTime);

    test2.forEach((element) {
      morningdb.add(element.time);
    });

    List<Widget> morntime = [];
    morningTime.forEach((element) {
      if (morningdb.contains(element)) {
        morntime.add(statusBox(false, element));
      } else {
        morntime.add(statusBox(true, element));
      }
    });
    // print(morntime);

    List<Widget> evening = [
      statusBox(true, '5-6'),
      statusBox(false, '6-7'),
      statusBox(false, '7-8'),
      statusBox(true, '8-9'),
    ];

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                mydate(),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardA,
              leading: CircleAvatar(
                  child: Text(
                    counter(test2),
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.green),
              initiallyExpanded: true,
              title: Center(
                child: Text(
                  'Test Morning',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: _listview(morntime)),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
          //   child: ExpansionTileCard(
          //     // key: cardA,
          //     leading: CircleAvatar(
          //         child: Text(
          //           counter(test2),
          //           style: TextStyle(color: Colors.black),
          //         ),
          //         backgroundColor: Colors.green),
          //     initiallyExpanded: true,
          //     title: Center(
          //       child: Text(
          //         'Morning',
          //         style: TextStyle(color: Colors.black),
          //       ),
          //     ),
          //     subtitle: Center(
          //         child: Text('2nd Aug, 2020',
          //             style: TextStyle(color: Colors.black))),
          //     children: <Widget>[
          //       Divider(
          //         thickness: 1.0,
          //         height: 1.0,
          //       ),
          //       Align(
          //         alignment: Alignment.centerLeft,
          //         child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //               horizontal: 16.0,
          //               vertical: 8.0,
          //             ),
          //             child: _listview(evening)),
          //       ),
          //       ButtonBar(
          //         alignment: MainAxisAlignment.spaceAround,
          //         buttonHeight: 52.0,
          //         buttonMinWidth: 90.0,
          //         children: <Widget>[
          //           Icon(Icons.access_alarm),
          //           Icon(Icons.access_alarm),
          //           Icon(Icons.access_alarm),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _listview(t) {
    List<Widget> timeList = t;
    // String day = d;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: timeList,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Future<Widget> _popUpRate(isBooks, times) {
    String boo = "Book";
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Time'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[Text(times)],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () async {
                    if (isBooks == true) {
                      await BookingDBS.named(mydate()).updateUserData(
                          'abc', false, '9-9-2020', times, Timestamp.now());
                    }
                  },
                  child: Text(boo)),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textColor: Theme.of(context).primaryColor,
                child: const Text('Close'),
              ),
            ],
          );
        });
  }

  Widget statusBox(isBooked, time) {
    // Color statusColor = isBooked ? Colors.green[300] : Colors.red;
    String bookingTime = time;
    return GestureDetector(
      onTap: () {
        _popUpRate(isBooked, time);
        // setState(() async {
        //   if (isBooked == true) {
        //     await BookingDBS()
        //         .updateUserData('abc', false, time, Timestamp.now());
        //   }
        //   print(isBooked);
        // });
      },
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
              color: isBooked ? Colors.green[300] : Colors.red,
              borderRadius: BorderRadius.circular(10.0)),
          child: Align(
            child: Text(bookingTime),
            alignment: Alignment.center,
          ),
        ),
      ]),
    );
  }
}
