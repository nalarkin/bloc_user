// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_firebase_login/posts/bloc/post_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_firebase_login/app/app.dart';
import 'package:posts_repository/posts_repository.dart';

class MockAuthenticationRepository extends Mock
    implements FirestorePostsRepository {}

class MockPost extends Mock implements FirestorePost {}

void main() {
  group('PostBloc', () {
    final post = MockPost();
    late PostsRepository postsRepository;

    setUp(() {
      postsRepository = MockAuthenticationRepository();
    });

    test('initial state is PostInitial', () {
      when(() => postsRepository.posts()).thenAnswer(
        (_) => Stream.empty(),
      );
      expect(
        PostBloc(postsRepository: postsRepository).state,
        PostInitial(),
      );
    });

    group('Posts Changed', () {
      blocTest<PostBloc, PostState>(
        'emits PostLoadingSuccess when new posts are added',
        build: () {
          when(() => postsRepository.posts()).thenAnswer(
            (_) => Stream.value([post]),
          );
          return PostBloc(postsRepository: postsRepository);
        },
        expect: () => [
          PostLoadingSuccess(posts: [post])
        ],
      );
    });
  });
}
