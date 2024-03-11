import 'package:dio/dio.dart';
import 'package:dummy/internal/helpers/catch_exception.dart';

class ApiRequester {
  final String url = 'https://dummyapi.io/data/v1/';
  final String appId = '65e98d8edfd2145ec586984d'; // Ваш appId

  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<Response> toGet(String url) async {
    Dio dio = await initDio();

    try {
      // Добавляем заголовок app-id к каждому GET запросу
      dio.options.headers['app-id'] = appId;
      return dio.get(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url, {dynamic data}) async {
    Dio dio = await initDio();

    try {
      // Добавляем заголовок app-id к каждому POST запросу
      dio.options.headers['app-id'] = appId;
      return await dio.post(url, data: data);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPut(String url) async {
    Dio dio = await initDio();

    try {
      // Добавляем заголовок app-id к каждому PUT запросу
      dio.options.headers['app-id'] = appId;
      return dio.put(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toDelete(String url) async {
    Dio dio = await initDio();

    try {
      // Добавляем заголовок app-id к каждому DELETE запросу
      dio.options.headers['app-id'] = appId;
      return dio.delete(url);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
