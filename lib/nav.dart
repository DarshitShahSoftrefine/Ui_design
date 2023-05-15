import 'package:flutter/material.dart';
import 'package:ui_design/events.dart';

import 'coupons.dart';
import 'home_page.dart';
import 'map_page.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const CouponsPage(),
    const EventsPage(),
    const MapPage()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(10),
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          isExtended: true,
          //Floating action button on Scaffold
          onPressed: () {
            //code to execute on button press
          },
          child: const Text("Action!"), //icon inside button
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        // unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label:
              'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard_outlined,
            ),
            label:
              'Coupons',

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event_available_outlined,
            ),
            label:
              'Events',

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on_outlined,
            ),
            label:
            'Maps',

          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}