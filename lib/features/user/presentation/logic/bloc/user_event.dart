part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}
//получить всех пользователей 
class GetAllUserEvent extends UserEvent {}
// получить данные по айди
class GetUserByIdEvent extends UserEvent {
  final String id;

  GetUserByIdEvent({required this.id});
}

//создание пользователя 
class CreateUserEvent extends UserEvent {
  final UserPreview user;

  CreateUserEvent({required this.user});
}
