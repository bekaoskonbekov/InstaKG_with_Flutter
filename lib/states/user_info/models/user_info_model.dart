// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:flutter_riverpod_practice1/states/constants/firebase_field_name.dart';
import 'package:flutter_riverpod_practice1/states/posts/typedefs/user_id.dart';

class UserInfoModel extends MapView<String, String?> {
  final UserId userId;
  final String displayName;
  final String? email;
  UserInfoModel({
    required this.userId,
    required this.displayName,
    required this.email,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email
        });

  UserInfoModel.fromJson(
    Map<String, dynamic> json, {
    required UserId userId,
  }) : this(
          userId: userId,
          displayName: json[FirebaseFieldName.displayName] ?? '',
          email: json[FirebaseFieldName.email] ?? '',
        );

  @override
  bool operator ==(covariant UserInfoModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.displayName == displayName &&
        other.email == email;
  }

  @override
  int get hashCode => userId.hashCode ^ displayName.hashCode ^ email.hashCode;
}
