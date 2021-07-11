import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_repository/posts_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required PostsRepository postsRepository})
      : _postsRepository = postsRepository,
        super(
          PostInitial(),
        ) {
    _postSubscription = _postsRepository.posts().listen(_onPostChanged);
  }
  final PostsRepository _postsRepository;
  late final StreamSubscription<List<FirestorePost>> _postSubscription;

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostChanged) {
      yield* _mapPostChangedToState(event);
    } else if (event is PostAdded) {
      await _mapPostAddedToState(event);
    } else if (event is PostInitial) {
      // pass
    }
  }

  void _onPostChanged(List<FirestorePost> posts) => add(PostChanged(posts));

  Future<void> _mapPostAddedToState(PostAdded event) async {
    await _postsRepository.addNewPost(event.post);
  }

  Stream<PostState> _mapPostChangedToState(PostChanged event) async* {
    try {
      yield PostLoadingSuccess(posts: event.posts);
    } on Exception {
      yield PostLoadingFailure(posts: event.posts);
    }
  }

  @override
  Future<void> close() {
    _postSubscription.cancel();
    return super.close();
  }
}
