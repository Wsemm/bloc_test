import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;

  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(posts[index].title),
        );
      },
    );
  }
}
