import 'package:flutter/material.dart' as material show Image;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod_practice1/states/image_uploads/extensions/get_image_aspect_ratio.dart';

extension GetImageDataAspectRatio on Uint8List {
  Future<double> getAspectRatio() async {
    final image = material.Image.memory(this);
    return image.getAspectRatio();
  }
}
