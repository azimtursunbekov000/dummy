part of 'post_bloc.dart';

@immutable
sealed class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  final PostDataModel postPreview;

  PostLoadedState({required this.postPreview});
}

class PostDetailLoadedState extends PostState {
  final PostPreview postPreview;

  PostDetailLoadedState({required this.postPreview});
}

class PostErrorState extends PostState {
  final CatchException error;

  PostErrorState({required this.error});
}
