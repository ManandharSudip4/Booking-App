import 'package:firebase_login/models/bfc.dart';
import 'package:firebase_login/models/bookings.dart';
import 'package:firebase_login/screens/testscreens/bookings.dart';
import 'package:firebase_login/screens/testscreens/profile.dart';
import 'package:firebase_login/screens/testscreens/teams.dart';
import 'package:firebase_login/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login/services/database.dart';
import 'package:firebase_login/services/bookingdb.dart';
import 'package:provider/provider.dart';
import 'package:firebase_login/screens/home/bfcList.dart';
import 'settings_form.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  //this works
  // Home();

  // // String date;
  // Home.named(this.dates) {
  //   print('date: $dates');
  // }
  // // final String dates;
  // String dates;
  //this works
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int _currentIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screen = [Profile(), Teams(), Bookings(), BFCList()];
  final AuthService _auth = AuthService();

  void _onTap(index) {
    _pageController.jumpToPage(index);
  }

  void _onPageChange(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String tabIndex;
  @override
  // void initState() {
  //   tabIndex = widget.dates;
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: SettingsForm(),
            );
          });
    }

    // return StreamProvider<QuerySnapshot>.value(
    // if its from the querysnapshot simpleway
    // return StreamProvider<List<Booki>>.value(
    //   initialData: List(),
    //   // value: DatabaseService().bfc,
    //   // value: DatabaseService().test2, // for test purpose on how to get data
    //   value: BookingDBS().abc,
    // final key = new GlobalKey();
    return MultiProvider(
      providers: [
        // Provider<Bookings>(),
        StreamProvider<List<BFC>>.value(
            initialData: List(), value: DatabaseService().bfc)
      ],
      // initialData: List(),
      // // value: DatabaseService().bfc,
      // // value: DatabaseService().test2, // for test purpose on how to get data
      // value: BookingDBS().abc, // if its from the querysnapshot simpleway
      child: Scaffold(
        // backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('EASY'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'logout',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        // body: BFCList(),
        // body: TestList(),
        body: PageView(
          controller: _pageController,
          children: _screen,
          onPageChanged: _onPageChange,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Theme.of(context).primaryColor,
          fixedColor: Theme.of(context).accentColor,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(size: 35),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.group), title: Text('Team')),
            BottomNavigationBarItem(
                icon: Icon(Icons.book), title: Text('Bookings')),
            BottomNavigationBarItem(
                icon: Icon(Icons.portrait), title: Text('Profile'))
          ],
          onTap: (index) => _onTap(index),
        ),
      ),
    );
  }
}
