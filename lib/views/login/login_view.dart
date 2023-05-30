import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/states/auth/providers/auth_state_providers.dart';
import 'package:flutter_riverpod_practice1/views/components/constants/string.dart';
import 'package:flutter_riverpod_practice1/views/constants/app_colors.dart';
import 'package:flutter_riverpod_practice1/views/login/divider_with_margins.dart';
import 'package:flutter_riverpod_practice1/views/login/google_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text(Strings.welcomeToAppName,
                  style: Theme.of(context).textTheme.displaySmall),
              DividerWithMargins(),
              Text(Strings.logIntoYourAccount,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(height: 1.5)),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.loginButtonColor,
                    foregroundColor: AppColors.loginButtonTextColor),
                onPressed:
                    ref.read(authStateProvider.notifier).signInWithGoogle,
                child: GoogleButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
