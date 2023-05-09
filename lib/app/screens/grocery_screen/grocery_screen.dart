import 'package:clean_network/app/screens/grocery_screen/grocery_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import 'empty_grocery_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: Present GroceryItemScreen

          final manager = Provider.of<GroceryManager>(context, listen: false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroceryItemScreen(
                  // item is received from inside the widget to here 
                  onCreate: (item) {
                    manager.addItem(item);
                  },
                  onUpdate: (item) {}),
            ),
          );
        },
      ),
      body: buildGroceryScreen(),
    );
  }
  // TODO: Add buildGroceryScreen
}

Widget buildGroceryScreen() {
// 1
  return Consumer<GroceryManager>(
    // 2
    builder: (context, manager, child) {
// 3
      if (manager.groceryItems.isNotEmpty) {
        // TODO: Add GroceryListScreen
        return Container();
      } else {
        // 4
        return const EmptyGroceryScreen();
      }
    },
  );
}
