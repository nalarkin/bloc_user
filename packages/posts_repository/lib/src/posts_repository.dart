import 'dart:async';

import '../posts_repository.dart';

abstract class PostsRepository {
  Future<void> addNewPost(FirestorePosts post);

  Future<void> deletePost(FirestorePosts post);

  Stream<List<FirestorePosts>> posts();

  Future<void> updatePost(FirestorePosts post);
}
