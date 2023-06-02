import 'dart:async';

import 'package:flutter/material.dart' as material
    show Image, ImageConfiguration, ImageStreamListener ;

extension GetImageAspectRatio on material.Image {
  Future<double> getAspectRatio() async {
    final completer = Completer<double>();
    image
        .resolve(material.ImageConfiguration())
        .addListener(material.ImageStreamListener((imageInfo, synhronousCall) {
          final aspectRatio = imageInfo.image.height / imageInfo.image.width;
          imageInfo.image.dispose();
          completer.complete(aspectRatio);
        }));
        return completer.future;
  }
}
