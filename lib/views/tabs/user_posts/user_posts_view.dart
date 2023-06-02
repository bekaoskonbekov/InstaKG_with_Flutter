import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/views/components/animations/empty_content_with_text_animation_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../states/posts/providers/user_posts_provider.dart';
import '../../components/animations/error_animation_view.dart';
import '../../components/animations/loading_animation_view.dart';
import '../../components/constants/string.dart';
import '../../components/post/posts_grid_view.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
    return RefreshIndicator(
      onRefresh: () {
        ref.refresh(userPostsProvider);
        return Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return EmptyContentWithTextAnimationView(
              text: Strings.youHaveNoPosts,
            );
          } else {
            return PostsGridView(
              posts: posts,
            );
          }
        },
        error: (error, stackTrace) {
          return ErrorAnimationView();
        },
        loading: () {
          return LoadingAnimationView();
        },
      ),
    );
  }
}
