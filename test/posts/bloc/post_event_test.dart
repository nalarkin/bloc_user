// ignore_for_file: prefer_const_constructors
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_firebase_login/posts/bloc/post_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:posts_repository/posts_repository.dart';

class Mockpost extends Mock implements FirestorePost {}

void main() {
  group('PostEvent', () {
    group('PostChanged', () {
      final post = Mockpost();
      test('supports value comparisons, equality', () {
        expect(
          PostChanged([post]),
          PostChanged([post]),
        );
      });

      test('supports value comparisons, inequality', () {
        expect(
          PostChanged([post]) != PostChanged([post, post]),
          true,
        );
      });
    });
  });
}
