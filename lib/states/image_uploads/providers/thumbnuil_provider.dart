import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/states/image_uploads/extensions/get_image_aspect_ratio.dart';
import 'package:flutter_riverpod_practice1/states/image_uploads/models/image_with_aspect_ratio.dart';
import 'package:flutter_riverpod_practice1/states/image_uploads/models/thumbnail_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../exceptions/could_not_build_thumbnuil_exeption.dart';
import '../models/file_type.dart';

final thumbnuilProvider = FutureProvider.family
    .autoDispose<ImageWithAspectRatio, ThumbnuilRequest>(
        (ref, ThumbnuilRequest request) async {
  final Image image;
  switch (request.fileType) {
    case FileType.image:
      image = Image.file(
        request.file,
        fit: BoxFit.fitHeight,
      );
      break;
    case FileType.video:
      final thumb = await VideoThumbnail.thumbnailData(
        video: request.file.path,
        imageFormat: ImageFormat.JPEG,
        quality: 75,
      );
      if (thumb == null) {
        throw ColudntNotBuildThumbnuilException();
      } else {
        image = Image.memory(
          thumb,
          fit: BoxFit.fitHeight,
        );
      }
      break;
  }
  final aspectRatio = await image.getAspectRatio();
  return ImageWithAspectRatio(
    image: image,
    aspectRatio: aspectRatio,
  );
});
