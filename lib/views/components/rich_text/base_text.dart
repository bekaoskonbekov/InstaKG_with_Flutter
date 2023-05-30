import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/views/components/rich_text/like_text.dart';

class BaseText {
  final String text;
  final TextStyle? style;
  BaseText({required this.text, this.style});

  factory BaseText.plain(
          {required String text, TextStyle? style = const TextStyle()}) =>
      BaseText(
        text: text,
        style: style,
      );
  factory BaseText.link(
          {required VoidCallback onTapped,
          required String text,
          TextStyle? style = const TextStyle(
              color: Colors.blue, decoration: TextDecoration.underline)}) =>
      LinkText(
        onTapped: onTapped,
        text: text,
        style: style,
      );
}
