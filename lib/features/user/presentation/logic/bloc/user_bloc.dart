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
        final List<UserPreviewModel> userModelList =
            await userUseCase.getAllUsers();

        emit(UserLoadedState(userModelList: userModelList));
        log('emit ===   $userModelList');
      } catch (e) {
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });

    on<GetUserByIdEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final UserPreviewModel userPreviewModel =
            await userUseCase.getUserById(id: event.id);
        emit(UserDetailLoadedState(userPreviewModel: userPreviewModel));
        log('emit ===   $userPreviewModel');
      } catch (e) {
        emit(UserErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
