// MARK: - SDk
import 'package:clean_network/app/screens/recipes_screen.dart';
import 'package:flutter/material.dart';

import 'explore_screen.dart';
import 'grocery_screen/grocery_screen.dart';
import 'home_screen/home_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen> {
  // static final theme = FooderlichTheme.light();
  // 7
  int _selectedIndex = 0;
  // 8
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen(),
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
        // selectedItemColor: Colors.black,
        // unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // 6
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To buy',
          ),
        ],
      ),
    );
  }
}
