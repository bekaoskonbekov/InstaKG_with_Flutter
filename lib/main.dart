import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/firebase_options.dart';
import 'package:flutter_riverpod_practice1/states/auth/models/auth_result.dart';
import 'package:flutter_riverpod_practice1/states/auth/providers/auth_state_providers.dart';
import 'package:flutter_riverpod_practice1/states/providers/is_loading_provider.dart';
import 'package:flutter_riverpod_practice1/views/components/loading/loading_screen.dart';
import 'package:flutter_riverpod_practice1/views/login/login_view.dart';
import 'package:flutter_riverpod_practice1/views/main/main_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blueGrey,
            indicatorColor: Colors.blueGrey),
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: Consumer(builder: (context, ref, child) {
          ref.listen<bool>(isLoadingProvider, (_, isLoading) {
            if (isLoading) {
              LoadingScreen.instance().show(context: context);
            } else {
              LoadingScreen.instance().hide();
            }
          });
          final isLoggedIn =
              ref.watch(authStateProvider).result == AuthResult.success;

          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LoginView();
          }
        }));
  }
}
