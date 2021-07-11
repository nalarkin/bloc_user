part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostStarted extends PostEvent {}

class PostAdded extends PostEvent {}
class PostFetched extends PostEvent {}
class PostLoaded extends PostEvent {}