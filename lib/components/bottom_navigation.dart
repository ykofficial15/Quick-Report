import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'user.dart';
import 'complaint.dart';
import 'lists.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  List<Widget> pageList = [
    home(),
    complaint(),
    lists(),
    user(),
  ];
  @override
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pageList.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          // iconSize: 20,
          backgroundColor:Color.fromARGB(255, 232, 248, 255),
          selectedFontSize: 10,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              tooltip: 'Home',
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                  tooltip: 'Complaint',
              icon: Icon(Icons.add_box),
              label: 'Add Complaint',
            ),
            BottomNavigationBarItem(
                  tooltip: 'Status',
              icon: Icon(Icons.data_usage),
              label: 'Status',
            ),
            BottomNavigationBarItem(
                  tooltip: 'Profile',
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
