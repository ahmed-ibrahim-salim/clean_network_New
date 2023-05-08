// MARK: - SDk
import 'package:clean_network/app/screens/recipes_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'explore_screen.dart';
import 'grocery_screen/grocery_screen.dart';
import 'home_screen/home_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen> {
  // 8
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
//MARK: - wait 2 sec then push Home screen

    // VideoApp
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(title: Text("Tiktok")),
        body: pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          // 5
          // selectedItemColor: Colors.black,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          // 6
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To buy',
            ),
          ],
        ),
      );
    });
  }
}
