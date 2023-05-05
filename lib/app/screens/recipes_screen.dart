import 'package:flutter/material.dart';

import '../../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/simple_recipe.dart';

class RecipesScreen extends StatelessWidget {
  // 1
  final exploreService = MockFooderlichService();

  RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
// 2
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          //
          final List<SimpleRecipe> recipes = snapshot.data ?? [];

          // TODO: Add RecipesGridView Here
          return RecipesGridView(recipes: recipes);
          // const Center(child: Text('Recipes Screen'));
          //
        } else {
          // 6

          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
