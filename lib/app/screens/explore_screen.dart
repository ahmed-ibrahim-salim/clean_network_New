import 'package:flutter/material.dart';

import '../../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 2
    return FutureBuilder(
        future: mockService.getExploreData(),
        //
        builder: (context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //
            final recipes = snapshot.data?.todayRecipes ?? [];
            //
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
// 7
                TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
// 8
                const SizedBox(height: 16),
                // 9
                // TODO: Replace this with FriendPostListView
                FriendPostListView(
                    friendPosts: snapshot.data?.friendPosts ?? []),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
