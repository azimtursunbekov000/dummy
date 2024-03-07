part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final List<UserPreviewModel> userModelList;

  UserLoadedState({required this.userModelList});
}

final class UserDetailLoadedState extends UserState {
  final UserPreviewModel userPreviewModel;

  UserDetailLoadedState({required this.userPreviewModel});
}

final class UserErrorState extends UserState {
  final CatchException error;

  UserErrorState({required this.error});
}
