import 'dart:collection';

import 'package:flutter_riverpod_practice1/states/constants/firebase_field_name.dart';

import '../../posts/typedefs/user_id.dart';

class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName ?? '',
          FirebaseFieldName.email: email ?? '',
        });
}
