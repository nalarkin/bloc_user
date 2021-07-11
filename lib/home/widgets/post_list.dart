import 'package:flutter/material.dart';
// import 'package:flutter_firebase_login/posts/posts.dart';
import 'package:posts_repository/posts_repository.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final FirestorePost post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('$post', style: textTheme.caption),
        title: Text(post.date.toDate().toString()),
        isThreeLine: true,
        subtitle: Text(post.content),
        dense: true,
      ),
    );
  }
}
