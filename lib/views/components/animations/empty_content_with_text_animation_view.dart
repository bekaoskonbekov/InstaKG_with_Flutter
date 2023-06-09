import 'package:flutter/material.dart';
import 'package:flutter_riverpod_practice1/views/components/animations/empty_content_animation_view.dart';

class EmptyContentWithTextAnimationView extends StatelessWidget {
  final String text;

  const EmptyContentWithTextAnimationView({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white54),
            ),
          ),
          EmptyContentAnimationView()
        ],
      ),
    );
  }
}
