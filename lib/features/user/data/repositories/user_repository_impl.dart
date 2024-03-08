import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:dummy/features/user/domain/repositories/user_repository.dart';
import 'package:dummy/internal/helpers/api_requester.dart';
import 'package:dummy/internal/helpers/catch_exception.dart';

class UserRepositoryImpl implements UserRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<DataModel> getAllUsers() async {
    try {
      Response response = await apiRequester.toGet('user');

      log('getAllUsers response statusCode == ${response.statusCode}');
      log('getAllUsers response data == ${response.data}');

      return DataModel.fromJson(response.data);
    } catch (e) {
      print('error $e');
      throw CatchException.convertException(e);
    }
  }
}
