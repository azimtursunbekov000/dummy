import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dummy/features/post/data/models/post_model.dart';
import 'package:dummy/features/post/domain/repositories/post_repository.dart';
import 'package:dummy/internal/helpers/api_requester.dart';
import 'package:dummy/internal/helpers/catch_exception.dart';

class PostUserRepositoryImpl implements PostRepository {
  ApiRequester apiRequester = ApiRequester();
  @override
  Future<PostDataModel> getAllPost() async {
    try {
      Response response = await apiRequester.toGet('post');
      log('getPost response statusCode == ${response.statusCode}');
      log('getPost response data == ${response.data}');

      return PostDataModel.fromJson(response.data);
    } catch (e) {
      print("error post impl $e");
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<PostPreview> getUserDetailById({required String id}) async {
    try {
      Response response = await apiRequester.toGet('post/$id');
      log('getPostDetail response statusCode == ${response.statusCode}');
      log('getPostDetail response data == ${response.data}');

      return PostPreview.fromJson(response.data);
    } catch (e) {
       print("error postDetail impl $e");
      throw CatchException.convertException(e);

    }
  }
}
