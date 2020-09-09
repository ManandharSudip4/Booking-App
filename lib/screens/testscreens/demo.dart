import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:firebase_login/models/bookings.dart';
import 'package:provider/provider.dart';

class Expand extends StatefulWidget {
  @override
  _ExpandState createState() => _ExpandState();
}

class _ExpandState extends State<Expand> {
  // final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  // final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    final test2 = Provider.of<List<Booki>>(context);
    test2.forEach((test) {
      // print(test.uid);
      // print(test.status);
      // print(test.time);
      // print(test.endtime);
    });

    String counter(dynamic tester) {
      int count = 0;
      for (var j in tester) {
        if (j.status == true) {
          count += 1;
        }
      }
      return count.toString();
    }

    List morningdb = [];
    test2.forEach((element) {
      morningdb.add(element.time);
    });
    // print(morningdb);  
    // ignore: unused_local_variable
    List morningTime = ['6-7', '7-8', '8-9', '9-10', '10-11', '11-12'];

    // List<Widget> morning = [
    //   for (var i in morningTime) statusBox(true, i),
    //   // for (var i in test2) statusBox(i.status, i.time),
    // ];

    List<String> timess = ['12-1', '1-2', '2-3', '3-4', '4-5'];
    List<Widget> afternoon = [for (var i in timess) statusBox(true, i)];
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
                  'Test',
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
                      child: _listview(evening)),
                ),
              ],
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
                  'Morning',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              subtitle: Center(
                  child: Text('2nd Aug, 2020',
                      style: TextStyle(color: Colors.black))),
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
                      child: _listview(evening)),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    Icon(Icons.access_alarm),
                    Icon(Icons.access_alarm),
                    Icon(Icons.access_alarm),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardB,
              leading: CircleAvatar(
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.green),
              initiallyExpanded: true,
              title: Center(
                child: Text(
                  'Afternoon',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              subtitle: Center(
                  child: Text('2nd Aug, 2020',
                      style: TextStyle(color: Colors.black))),
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
                    child: _listview(afternoon),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    Icon(Icons.access_alarm),
                    Icon(Icons.access_alarm),
                    Icon(Icons.access_alarm),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              // key: cardB,
              leading: CircleAvatar(
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.green),
              initiallyExpanded: true,
              title: Center(
                child: Text(
                  'Evening',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              subtitle: Center(
                  child: Text('2nd Aug, 2020',
                      style: TextStyle(color: Colors.black))),
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
                    child: _listview(evening),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    Icon(Icons.access_alarm),
                    Icon(Icons.access_alarm),
                    Icon(Icons.access_alarm),
                  ],
                ),
              ],
            ),
          ),
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

  Widget statusBox(isBooked, time) {
    Color statusColor = isBooked ? Colors.green[300] : Colors.red;
    String bookingTime = time;
    return GestureDetector(
      onTap: () {
        print('Details');
      },
      child: Stack(children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
              color: statusColor, borderRadius: BorderRadius.circular(10.0)),
          child: Align(
            child: Text(bookingTime),
            alignment: Alignment.center,
          ),
        ),
      ]),
    );
  }
}
