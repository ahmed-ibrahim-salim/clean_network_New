// MARK: - SDk
import 'package:flutter/material.dart';

import '../../helpers/fooderlich_them.dart';
import 'explore_screen.dart';
import 'home_screen/home_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen> {
  static final theme = FooderlichTheme.light();
  // 7
  int _selectedIndex = 0;
  // 8
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    // const Card1(),
    // const Card2(),
  ];

// 9
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
//MARK: - wait 2 sec then push Home screen

    // VideoApp
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // 5
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // 6
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.card_giftcard),
          //   label: 'Card3',
          // ),
        ],
      ),
    );
  }
}
