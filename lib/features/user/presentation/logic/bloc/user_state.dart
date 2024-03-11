part of 'user_bloc.dart';

@immutable
sealed class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final UserDataModel userModelList;

  UserLoadedState({required this.userModelList});
}

class UserDetailLoadedState extends UserState {
  final UserPreview userPreview;

  UserDetailLoadedState({required this.userPreview});
}

class UserErrorState extends UserState {
  final CatchException error;

  UserErrorState({required this.error});
}

class UserCreatedState extends UserState {}