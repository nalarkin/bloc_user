// ignore_for_file: prefer_const_constructors
// import 'user';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_repository/posts_repository.dart';

void main() {
  group('User', () {
    const id = 'mock-id';
    const idTo = 'mock-idTo';
    const idFrom = 'mock-idFrom';
    const content = 'mock-content';
    var date = Timestamp.fromMillisecondsSinceEpoch(1609459200000);
    const read = false;

    test('FirebaseUser value equality', () {
      expect(
        FirestorePost(
            id: id,
            idFrom: idFrom,
            idTo: idTo,
            read: read,
            date: date,
            content: content),
        FirestorePost(
            id: id,
            idFrom: idFrom,
            idTo: idTo,
            read: read,
            date: date,
            content: content),
      );
    });

    test('FirebaseUser copyWith copies the correct values', () {
      var beforeChange = FirestorePost(
          id: id,
          idFrom: idFrom,
          idTo: idTo,
          read: read,
          date: date,
          content: content);
      var expectedChange = FirestorePost(
          id: id,
          idFrom: 'updated-idFrom',
          idTo: 'updated-idTo',
          read: true,
          date: Timestamp.fromMillisecondsSinceEpoch(1209459200000),
          content: 'updated-content');

      expect(
          beforeChange.copyWith(
              id: id,
              idFrom: 'updated-idFrom',
              idTo: 'updated-idTo',
              read: true,
              date: Timestamp.fromMillisecondsSinceEpoch(1209459200000),
              content: 'updated-content'),
          expectedChange);
    });
    test('FirebaseUser copyWith maintains all values not provided.', () {
      var beforeChange = FirestorePost(
          id: id,
          idFrom: idFrom,
          idTo: idTo,
          read: read,
          date: date,
          content: content);
      expect(beforeChange.copyWith(), beforeChange);
    });

    test('FirebaseUser sucessfully converts to UserEntity', () {
      final post = FirestorePost(
          id: id,
          idFrom: idFrom,
          idTo: idTo,
          read: read,
          date: date,
          content: content);
      final entity = PostEntity(
          id: id,
          idFrom: idFrom,
          idTo: idTo,
          read: read,
          date: date,
          content: content);

      expect(post.toEntity(), entity);
    });

    test('Firestore user is created given an UserEntity.', () {
      final user = FirestorePost(
          id: id,
          idFrom: idFrom,
          idTo: idTo,
          read: read,
          date: date,
          content: content);
      final entity = PostEntity(
          id: id,
          idFrom: idFrom,
          idTo: idTo,
          read: read,
          date: date,
          content: content);
      expect(FirestorePost.fromEntity(entity), user);
    });
  });
}
