part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostStarted extends PostEvent {}

class PostAdded extends PostEvent {
  const PostAdded(this.post);
  final FirestorePost post;
}

class PostChanged extends PostEvent {
  const PostChanged(this.posts);

  final List<FirestorePost> posts;

  @override
  List<Object> get props => [posts];
}

class PostFetched extends PostEvent {}

class PostLoaded extends PostEvent {}
