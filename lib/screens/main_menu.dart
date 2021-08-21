import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsian/screens/Home/bag.dart';
import 'package:skripsian/screens/Home/home.dart';
import 'package:skripsian/screens/Home/profile.dart';
import 'package:skripsian/screens/Home/wishlist.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _index = 0;
  List<Widget> _widgetOption = <Widget>[
    Home(),
    Bag(),
    Wishlist(),
    Profile(),
  ];

  _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: _widgetOption.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.homeOutline),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.shoppingBagOutline),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.heartOutline),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
            label: 'Profile',
          ),
        ],
        currentIndex: _index,
        onTap: _onItemTapped,
      ),
    );
  }
}
