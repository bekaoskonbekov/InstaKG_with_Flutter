// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_riverpod_practice1/states/constants/firebase_field_name.dart';
import 'package:flutter_riverpod_practice1/states/posts/typedefs/post_id.dart';

import '../../posts/typedefs/user_id.dart';
import '../typedefs/comment_id.dart';

class Comment {
  final CommentId id;
  final String comment;
  final DateTime createdAt;
  final UserId fromUserId;
  final PostId onPostId;
  Comment(Map<String, dynamic> json, {required this.id})
      : comment = json[FirebaseFieldName.comment],
        createdAt = (json[FirebaseFieldName.createdAt] as Timestamp).toDate(),
        fromUserId = (json[FirebaseFieldName.userId]),
        onPostId = (json[FirebaseFieldName.postId]);

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.comment == comment &&
        other.createdAt == createdAt &&
        other.fromUserId == fromUserId &&
        other.onPostId == onPostId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        comment.hashCode ^
        createdAt.hashCode ^
        fromUserId.hashCode ^
        onPostId.hashCode;
  }
}
