part of 'post_bloc.dart';

@immutable
abstract class PostState {}

abstract class PostsActionState extends PostState {}

class PostsInitial extends PostState {}

class PostsFetchingLoadingState extends PostState {}

class PostsFetchingErrorState extends PostState {}

class PostFetchingSuccessfulState extends PostState {
  final List<PostDataUiModel> posts;
  PostFetchingSuccessfulState({
    required this.posts,
  });
}

class PostsAdditionSuccessState extends PostsActionState {}

class PostsAdditionErrorState extends PostsActionState {}
