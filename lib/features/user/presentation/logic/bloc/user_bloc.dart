import 'dart:developer';

import 'package:bloc/bloc.dart';
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
        final DataModel userModelList = await userUseCase.getAllUsers();

        emit(UserLoadedState(userModelList: userModelList));
        log('emit ===   $userModelList');
      } catch (e) {
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });

//получение детальной информации по id
    on<GetUserByIdEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final UserPreview userFullList =
            await userUseCase.getUserDetailByd(id: event.id);
        emit(UserDetailLoadedState(userFullList: userFullList));
      } catch (e) {
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
