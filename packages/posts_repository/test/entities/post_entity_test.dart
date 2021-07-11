// ignore_for_file: prefer_const_constructors
// import 'user';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:posts_repository/posts_repository.dart';

void main() {
  group('PostEntity tests', () {
    const id = 'mock-id';
    const idTo = 'mock-idTo';
    const idFrom = 'mock-idFrom';
    const content = 'mock-content';
    var date = Timestamp.fromMillisecondsSinceEpoch(1609459200000);
    const read = false;
    var mockJson = {
      'id': id,
      'idTo': idTo,
      'idFrom': idFrom,
      'content': content,
      'date': date,
      'read': read,
    };

    test('PostEntity value equality', () {
      expect(
        PostEntity(
            id: id,
            idFrom: idFrom,
            idTo: idTo,
            read: read,
            date: date,
            content: content),
        PostEntity(
            id: id,
            idFrom: idFrom,
            idTo: idTo,
            read: read,
            date: date,
            content: content),
      );
    });

    test('PostEntity sucessfully created fromJson', () {
      final entity = PostEntity(
          id: id,
          idFrom: idFrom,
          idTo: idTo,
          content: content,
          date: date,
          read: read);

      expect(entity, PostEntity.fromJson(mockJson));
    });

    test('successfully created toDocument.', () {
      final entity = PostEntity(
          id: id,
          idFrom: idFrom,
          idTo: idTo,
          read: read,
          date: date,
          content: content);
      expect(entity.toDocument(), mockJson);
    });

      test('value remains the same fromJson toDocument.', () {
      expect(PostEntity.fromJson(mockJson).toDocument(), mockJson);
    });
  });
}
