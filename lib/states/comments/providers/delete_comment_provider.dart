import 'package:flutter_riverpod_practice1/states/comments/notifiers/delete_comment_notifier.dart';
import 'package:flutter_riverpod_practice1/states/image_uploads/typedefs/is_loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deleteCommentProvider =
    StateNotifierProvider<DeleteCommentStateNotifier, IsLoading>((ref) {
  return DeleteCommentStateNotifier();
});
