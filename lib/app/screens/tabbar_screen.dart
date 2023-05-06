// MARK: - SDk
import 'package:clean_network/app/screens/recipes_screen.dart';
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
    RecipesScreen(),
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
      appBar: AppBar(title: Text("Tiktok")),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // 5
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // 6
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Recipes',
          ),
        ],
      ),
    );
  }
}
