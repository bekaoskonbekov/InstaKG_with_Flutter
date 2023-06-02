import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/states/comments/providers/delete_comment_provider.dart';
import 'package:flutter_riverpod_practice1/states/user_info/providers/user_info_model_provider.dart';
import 'package:flutter_riverpod_practice1/views/components/animations/small_error_animation_view.dart';
import 'package:flutter_riverpod_practice1/views/components/dialog/delete_dialogs.dart';
import 'package:flutter_riverpod_practice1/views/components/dialog/dialog_model.dart';
import 'package:flutter_riverpod_practice1/views/constants/string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../states/auth/providers/user_id_provider.dart';
import '../../../states/comments/models/comment_model.dart';

class CommentTile extends ConsumerWidget {
  final Comment comment;
  const CommentTile({required this.comment, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(userInfoModelProvider(comment.fromUserId));
    return userInfo.when(
      data: (userInfoModel) {
        final currentUserId = ref.read(userIdProvider);
        return ListTile(
          trailing: currentUserId == comment.fromUserId
              ? IconButton(
                  onPressed: () async {
                    final shouldDeleteComment =
                        await displayDeleteDialog(context);
                    if (shouldDeleteComment) {
                      await ref
                          .read(deleteCommentProvider.notifier)
                          .deleteComment(commentId: comment.id);
                    }
                  },
                  icon: Icon(Icons.delete))
              : null,
          title: Text(userInfoModel.displayName),
          subtitle: Text(comment.comment),
        );
      },
      error: (error, stackTrace) {
        return SmallErrorAnimationView();
      },
      loading: () {
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<bool> displayDeleteDialog(
    BuildContext context,
  ) async {
    return DeleteDialog(titleOfObjectDelete: Strings.comment)
        .present(context)
        .then((value) => value ?? false);
  }
}
