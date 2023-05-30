import 'package:flutter/material.dart';

import '../../../states/posts/models/post.dart';

class PostThunbnailView extends StatelessWidget {
  final Post post;
  final VoidCallback onTapped;
  const PostThunbnailView(
      {Key? key, required this.post, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTapped,
        child: Image.network(
          post.thumbnailUrl,
          fit: BoxFit.cover,
        ));
  }
}
