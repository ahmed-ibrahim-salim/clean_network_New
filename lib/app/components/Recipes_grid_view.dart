import 'package:flutter/cupertino.dart';

import '../models/simple_recipe.dart';
import 'components.dart';

class RecipesGridView extends StatelessWidget {
  // 1
  final List<SimpleRecipe> recipes;
  const RecipesGridView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
// 2
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(
            recipe: simpleRecipe,
          );
        },
      ),
    );
  }
}
