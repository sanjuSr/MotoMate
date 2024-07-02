import 'package:bikeserviceapp/USER/Profile.dart';
import 'package:bikeserviceapp/USER/RSA/Road-Side-Assistance.dart';
import 'package:bikeserviceapp/USER/User-View-Booking/service.dart';
import 'package:bikeserviceapp/USER/user-home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserBottomBar extends StatefulWidget {
  const UserBottomBar({Key? key}) : super(key: key);

  @override
  State<UserBottomBar> createState() => _HomeeState();
}

class _HomeeState extends State<UserBottomBar> {
  int _selectedIndex = 0;


  final List<Widget> _pages = [
    UserHome(),
    Service(),
    RSA(),
    Profile(),// Placeholder for the fourth page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(),
          unselectedLabelStyle: const TextStyle(),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          backgroundColor: Colors.redAccent[100],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.home_repair_service),
              label: 'Service',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.two_wheeler),
              label: 'Assist',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

