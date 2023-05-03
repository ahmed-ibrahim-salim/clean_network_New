import 'package:flutter/material.dart';

import '../models/models.dart';
import 'components.dart';

class TodayRecipeListView extends StatelessWidget {
  //
  final List<ExploreRecipe> recipes;

  TodayRecipeListView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // 5
        Text('Recipes of the Day',
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Container(
          height: 400,
          // TODO: Add ListView Here
          color: Colors.transparent,
          child: ListView.separated(
              itemBuilder: ((context, index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              }),
              scrollDirection: Axis.horizontal,
// 4
              itemCount: recipes.length,
              separatorBuilder: ((context, index) => SizedBox(
                    width: 16,
                  ))),
        ),
      ]),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
