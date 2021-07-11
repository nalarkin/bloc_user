import 'package:cloud_firestore/cloud_firestore.dart';

import '../posts_repository.dart';


class FirestorePostsRepository implements PostsRepository {
  final usersCollection = FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> addNewPost(FirestorePosts post) {
    return usersCollection.doc(post.id).set((post.toEntity().toDocument()));
  }

  @override
  Future<void> deletePost(FirestorePosts post) async {
    return usersCollection.doc(post.id).delete();
  }

  @override
  Stream<List<FirestorePosts>> posts() {
    return usersCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FirestorePosts.fromEntity(PostEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updatePost(FirestorePosts post) {
    return usersCollection.doc(post.id).update(post.toEntity().toDocument());
  }
}
