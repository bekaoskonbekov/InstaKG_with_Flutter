import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/views/components/rich_text/base_text.dart';

import 'like_text.dart';

class RichTextWidget extends StatelessWidget {
  final TextStyle? styleForAll;
  final Iterable<BaseText> texts;
  const RichTextWidget({Key? key, this.styleForAll, required this.texts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: texts.map((baseText) {
      if (baseText is LinkText) {
        return TextSpan(
          text: baseText.text,
          style: styleForAll?.merge(baseText.style),
          recognizer: TapGestureRecognizer()..onTap = baseText.onTapped,
        );
      } else {
        return TextSpan(
          text: baseText.text,
          style: styleForAll?.merge(baseText.style),
        );
      }
    }).toList()));
  }
}
