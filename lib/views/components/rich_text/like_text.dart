import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/views/components/rich_text/base_text.dart';

class LinkText extends BaseText {
  final VoidCallback onTapped;
  LinkText({required super.text, required this.onTapped, super.style});
}
