import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/states/auth/providers/auth_state_providers.dart';
import 'package:flutter_riverpod_practice1/views/components/constants/string.dart';
import 'package:flutter_riverpod_practice1/views/components/dialog/dialog_model.dart';
import 'package:flutter_riverpod_practice1/views/components/dialog/logout_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../tabs/user_posts/user_posts_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Strings.appName),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.film),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_photo_alternate_outlined)),
            IconButton(
                onPressed: () async {
                  final shouldLogout = await LogOutDialog()
                      .present(context)
                      .then((value) => value ?? false);
                  if (shouldLogout) {
                    await ref.read(authStateProvider.notifier).logOut();
                  }
                },
                icon: const Icon(Icons.logout)),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(
              icon: Icon(Icons.search),
            ),
            Tab(
              icon: Icon(Icons.home),
            ),
          ]),
        ),
        body: TabBarView(children: [
          const UserPostsView(),
          const UserPostsView(),
          const UserPostsView(),
        ]),
      ),
    );
  }
}
