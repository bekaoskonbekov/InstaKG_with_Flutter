import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/extensions/string/as_html_color_to_color.dart';

class AppColors {
  static final loginButtonColor = '#cfc9c2'.htmlColorToColor();
  static const loginButtonTextColor = Colors.black;
  static final googleColor = '#4285F4'.htmlColorToColor();
  static final facebookColor = '#3b5998'.htmlColorToColor();
  const AppColors._();
}
