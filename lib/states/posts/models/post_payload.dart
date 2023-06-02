// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_practice1/states/posts/models/post_key.dart';

import '../../image_uploads/models/file_type.dart';
import '../../post_settings/models/post_settings.dart';
import '../typedefs/user_id.dart';

class PostPayload extends MapView<String, dynamic> {
  PostPayload({
    required UserId userId,
    required String message,
    required String thumbnailUrl,
    required String fileUrl,
    required FileType fileType,
    required String fileName,
    required double aspectRatio,
    required String thumbnailStorageId,
    required String orginalFileStorageId,
    required Map<PostSetting, bool> postSettings,
  }) : super({
          PostKey.userId: userId,
          PostKey.message: message,
          PostKey.thumbnailUrl: thumbnailUrl,
          PostKey.createdAt: FieldValue.serverTimestamp(),
          PostKey.fileUrl: fileUrl,
          PostKey.fileType: fileType,
          PostKey.fileName: fileName,
          PostKey.aspectRatio: aspectRatio,
          PostKey.thumbnailStoreageId: thumbnailStorageId,
          PostKey.orginalFileStorageId: orginalFileStorageId,
          PostKey.postSettings: {
            for (final postSetting in postSettings.entries)
              postSetting.key.storageKey: postSetting.value,
          }
        });
}
