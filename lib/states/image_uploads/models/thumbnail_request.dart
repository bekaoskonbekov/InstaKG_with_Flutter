import 'dart:io';

import 'file_type.dart';

class ThumbnuilRequest {
  final File file;
  final FileType fileType;

  ThumbnuilRequest({required this.file, required this.fileType});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThumbnuilRequest &&
          runtimeType == other.runtimeType &&
          file == other.file &&
          fileType == other.fileType;
  @override
  int get hashCode => Object.hashAll([runtimeType, file, fileType]);
}
