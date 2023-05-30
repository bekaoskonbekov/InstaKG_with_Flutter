import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/views/components/constants/string.dart';
import 'package:flutter_riverpod_practice1/views/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.google,
            color: AppColors.googleColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(Strings.google),
        ],
      ),
    );
  }
}
