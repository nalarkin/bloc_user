// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_firebase_login/posts/bloc/post_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:posts_repository/posts_repository.dart';

class MockPost extends Mock implements FirestorePost {}

void main() {
  group('PostState', () {
    group('PostLoadingSuccess', () {
      final post = MockPost();
      test('supports value comparisons, equality', () {
        expect(
          PostLoadingSuccess(posts: [post]),
          PostLoadingSuccess(posts: [post]),
        );
      });

      test('supports value comparisons, inequality', () {
        expect(
          PostLoadingSuccess(posts: [post]) !=
              PostLoadingSuccess(posts: [post, post]),
          true,
        );
      });
    });
  });
}
