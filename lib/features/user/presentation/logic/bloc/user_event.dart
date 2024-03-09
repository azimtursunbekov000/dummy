part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetAllUserEvent extends UserEvent {}

class GetUserByIdEvent extends UserEvent {
  final String id;

  GetUserByIdEvent({required this.id});
}
