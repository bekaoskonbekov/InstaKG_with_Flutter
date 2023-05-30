import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/states/providers/user_posts_provider.dart';
import 'package:flutter_riverpod_practice1/views/components/animations/error_animation_view.dart';
import 'package:flutter_riverpod_practice1/views/components/animations/loading_animation_view.dart';
import 'package:flutter_riverpod_practice1/views/components/post/posts_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/animations/empty_content_with_text_animation_view.dart';
import '../../components/constants/string.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(userPostsProvider);
        return Future.delayed(const Duration(seconds: 1));
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return EmptyContentWithTextAnimationView(
              text: Strings.youHaveNoPosts,
            );
          } else {
            return PostsGridView(posts: posts);
          }
        },
        loading: () {
          return LoadingAnimationView();
        },
        error: (error, stackTrace) {
          return ErrorAnimationView();
        },
      ),
    );
  }
}
