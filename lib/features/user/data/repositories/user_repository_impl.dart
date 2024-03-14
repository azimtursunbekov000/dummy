import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dummy/features/user/data/models/user_created_model.dart';
import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:dummy/features/user/domain/repositories/user_repository.dart';
import 'package:dummy/internal/helpers/api_requester.dart';
import 'package:dummy/internal/helpers/catch_exception.dart';

class UserRepositoryImpl implements UserRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<UserDataModel> getAllUsers() async {
    try {
      Response response = await apiRequester.toGet('user');

      log('getAllUsers response statusCode == ${response.statusCode}');
      log('getAllUsers response data == ${response.data}');

      return UserDataModel.fromJson(response.data);
    } catch (e) {
      print('error $e');
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<UserPreview> getUserDetailById({required String id}) async {
    try {
      Response response = await apiRequester.toGet('user/$id');
      log('getUserDEtail response statusCode == ${response.statusCode}');
      log('getUserDEtail response data == ${response.data}');

      return UserPreview.fromJson(response.data);
    } catch (e) {
      print('error by id $e'.toString());
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<UserCreated?> createUser({required UserCreated user}) async {
    try {
      Response response =
          await apiRequester.toPost('user/create', data: user.toJson());
      print('User created: ${response.data}');
      print('User created: ${createUser(user: user)}');
    } catch (e) {
      log('error create impl $e');
    }
    return null;
  }
}
