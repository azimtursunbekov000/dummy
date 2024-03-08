part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitialState extends UserState {}

final class UserLoadingState extends UserState {}

final class UserLoadedState extends UserState {
  final DataModel userModelList;

  UserLoadedState({required this.userModelList});
}

final class UserDetailLoadedState extends UserState {
  final UserPreview userFullList;

  UserDetailLoadedState({required this.userFullList});
}

final class UserErrorState extends UserState {
  final CatchException error;

  UserErrorState({required this.error});
}
