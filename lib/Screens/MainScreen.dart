import 'package:flutter/material.dart';
import 'package:swiggy_clone/Screens/Cart.dart';
import 'package:swiggy_clone/Screens/Home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Cart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.orange),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_rounded),
                label: 'Cart',
                backgroundColor: Colors.orange)
          ]),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
