import 'package:flutter_riverpod_practice1/states/image_uploads/notifiers/image_upload_notifier.dart';
import 'package:flutter_riverpod_practice1/states/image_uploads/typedefs/is_loading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final imageUploadProvider =
    StateNotifierProvider<ImageUploadNotifier, IsLoading>(
  (ref) => ImageUploadNotifier(),
);
