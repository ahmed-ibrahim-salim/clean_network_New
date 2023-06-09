import 'package:clean_network/app/components/components.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class FriendPostListView extends StatelessWidget {
  // 1
  final List<Post> friendPosts;
  const FriendPostListView({
    super.key,
    required this.friendPosts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
// 3
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// 4
          Text('Social Chefs ',
              style: Theme.of(context).textTheme.headlineMedium),
// 5
          const SizedBox(height: 16),
          // TODO: Add PostListView here
          // 6
          // 1
          ListView.separated(
// 2
            primary: false,
            // 3 make list not scrollable
            physics: const NeverScrollableScrollPhysics(),
            // 4 give full hight for the list
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: friendPosts.length,
            itemBuilder: (context, index) {
// 5
              final post = friendPosts[index];
              return FriendPostTile(post: post);
            },
            separatorBuilder: (context, index) {
// 6
              return const SizedBox(height: 16);
            },
          ),
        ],
      ),
    );
  }
}
