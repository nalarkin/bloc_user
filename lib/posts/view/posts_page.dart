import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/posts/posts.dart';
import 'package:posts_repository/posts_repository.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post')),
      body: BlocProvider(
        create: (_) =>
            PostBloc(postsRepository: context.read<FirestorePostsRepository>()),
        child: PostsList(),
      ),
    );
  }
}
