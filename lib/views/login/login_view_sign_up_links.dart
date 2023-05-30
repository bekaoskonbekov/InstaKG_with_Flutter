import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/views/components/constants/string.dart';
import 'package:flutter_riverpod_practice1/views/components/rich_text/base_text.dart';
import 'package:flutter_riverpod_practice1/views/components/rich_text/rich_text_widget.dart';

class LoginViewSignUpLinks extends StatelessWidget {
  const LoginViewSignUpLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll: Theme.of(context).textTheme.subtitle1?.copyWith(height: 1.5),
      texts: [
        BaseText(text: Strings.dontHaveAnAccount),
        BaseText(text: Strings.signUpOn),
        BaseText.link(
            text: Strings.googleSignupUrl,
            onTapped: () {
              Uri.parse(Strings.googleSignupUrl);
            }),
        BaseText.plain(text: Strings.orCreateAnAccountOn)
      ],
    );
  }
}
