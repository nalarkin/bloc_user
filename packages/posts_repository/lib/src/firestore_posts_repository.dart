import 'package:cloud_firestore/cloud_firestore.dart';

import '../posts_repository.dart';


class FirestorePostsRepository implements PostsRepository {
  final usersCollection = FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> addNewPost(FirestorePost post) {
    return usersCollection.doc(post.id).set((post.toEntity().toDocument()));
  }

  @override
  Future<void> deletePost(FirestorePost post) async {
    return usersCollection.doc(post.id).delete();
  }

  @override
  Stream<List<FirestorePost>> posts() {
    return usersCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FirestorePost.fromEntity(PostEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updatePost(FirestorePost post) {
    return usersCollection.doc(post.id).update(post.toEntity().toDocument());
  }
}
