import 'package:bloc/bloc.dart';
import 'package:dummy/features/user/data/models/user_created_model.dart';
import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:dummy/features/user/domain/use_cases/user_use_cases.dart';
import 'package:dummy/internal/helpers/catch_exception.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase userUseCase;
  UserBloc(this.userUseCase) : super(UserInitialState()) {
    on<GetAllUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final UserDataModel userModel = await userUseCase.getAllUsers();

        emit(UserLoadedState(userModelList: userModel));
        // log('emit ===   $userModelList');
      } catch (e) {
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });

//получение детальной информации по id
    on<GetUserByIdEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final UserPreview userPreview =
            await userUseCase.getUserDetailById(id: event.id);
        emit(UserDetailLoadedState(userPreview: userPreview));
      } catch (e) {
        print('фывфвфывфывфвфвфы$e');
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });

    on<CreateUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        await userUseCase.createUser(user: event.user);
      } catch (e) {
        print('error create user $e');
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
