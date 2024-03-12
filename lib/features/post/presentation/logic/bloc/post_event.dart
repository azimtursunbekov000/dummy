part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class GetAllPostEvent extends PostEvent {}

class GetDetailPostByIdEvent extends PostEvent {
  final String id;

  GetDetailPostByIdEvent({required this.id});
}
