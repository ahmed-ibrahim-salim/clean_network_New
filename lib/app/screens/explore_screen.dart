import 'package:flutter/material.dart';

import '../../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // 1
  final mockService = MockFooderlichService();

  late ScrollController _scrollController;

  _scrollListener() {
    //MARK: - can work for Pagination
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (isTop) {
        print("i am at the top");
      } else {
        print('i am at the bottom');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    //
    _scrollController.removeListener(_scrollListener);

    super.dispose();
  }

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
              controller: _scrollController,
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
