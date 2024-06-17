
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/MainPage/Home.dart';
import 'package:flutter_application/MainPage/profile.dart';
import 'package:flutter_application/MainPage/settings.dart';


class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    PengembalianScreen(),
    ProfileScreen(),

  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      Padding(
        padding: EdgeInsets.only(),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BottomNavigationBar(
            selectedItemColor: const Color.fromARGB(255, 223, 223, 223), // Color for the selected item
            unselectedItemColor: Color.fromARGB(90, 0, 0, 0), // Color for unselected items
            backgroundColor: Color.fromARGB(255, 82, 137, 215),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Profil',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
          ),
        ),
      ),
    ],
  );
}
}