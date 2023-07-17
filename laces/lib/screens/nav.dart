import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laces/screens/checkout.dart';
import 'package:laces/screens/favourites.dart';
import 'package:laces/screens/homepage.dart';



class MyNavBar extends StatefulWidget {
  const MyNavBar({Key? key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.house_fill),
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.heart_fill),
            icon: Icon(CupertinoIcons.heart),
            label: 'Favourites',
          ),
          NavigationDestination(
            selectedIcon: Icon(CupertinoIcons.bell_fill),
            icon: Icon(CupertinoIcons.bell),
            label: 'Notifications',
          ),
        ],
      ),
      body: getPage(currentPageIndex),
    );
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return Homepage();
      case 1:
        return Saved();
      case 2:
        return Cart();
      default:
        return Homepage();
    }
  }
}
