part of 'post_bloc.dart';


abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];

}

class PostInitial extends PostState {}
class PostLoadingInProgress extends PostState {}

class PostLoadingSuccess extends PostState {
  PostLoadingSuccess({this.posts = const <FirestorePost>[],});

  final List<FirestorePost> posts;

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'PostsLoaded { todos: $posts }';

}

class PostLoadingFailure extends PostState {}
