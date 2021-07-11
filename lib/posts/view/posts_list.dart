import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repository/posts_repository.dart';
import 'package:flutter_firebase_login/posts/posts.dart';
import 'package:flutter_firebase_login/home/home.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial || state is PostLoadingInProgress) {
          return const Center(child: Text('LOADING'));
        } else if (state is PostLoadingFailure) {
          return const Center(child: Text('failed to fetch posts'));
        } else if (state is PostLoadingSuccess) {
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (BuildContext context, int index) {
              return PostListItem(post: state.posts[index]);
            },
          );
        } else {
          return const Center(child: Text('This should never happen'));
        }
      },
    );
  }
}
