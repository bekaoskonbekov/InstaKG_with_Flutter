import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/states/image_uploads/models/thumbnail_request.dart';
import 'package:flutter_riverpod_practice1/states/image_uploads/providers/thumbnuil_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'animations/loading_animation_view.dart';
import 'animations/small_error_animation_view.dart';

class FileThumbnailView extends ConsumerWidget {
  final ThumbnuilRequest thumbnailRequest;

  const FileThumbnailView({
    Key? key,
    required this.thumbnailRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnail = ref.watch(
      thumbnuilProvider(thumbnailRequest),
    );

    return thumbnail.when(
      data: (imageWithAspectRatio) {
        return AspectRatio(
          aspectRatio: imageWithAspectRatio.aspectRatio,
          child: imageWithAspectRatio.image,
        );
      },
      loading: () {
        return LoadingAnimationView();
      },
      error: (error, stackTrace) {
        return SmallErrorAnimationView();
      },
    );
  }
}
