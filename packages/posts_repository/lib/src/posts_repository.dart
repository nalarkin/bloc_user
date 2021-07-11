import 'dart:async';

import '../posts_repository.dart';

abstract class PostsRepository {
  Future<void> addNewPost(FirestorePost post);

  Future<void> deletePost(FirestorePost post);

  Stream<List<FirestorePost>> posts();

  Future<void> updatePost(FirestorePost post);
}
