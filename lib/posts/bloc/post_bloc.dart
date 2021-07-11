import 'dart:async';

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
    // TODO: implement mapEventToState
  }

  void _onPostChanged(List<FirestorePost> posts) => add(PostAdded());

  @override
  Future<void> close() {
    _postSubscription.cancel();
    return super.close();
  }
}
