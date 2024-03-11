import 'package:dummy/features/post/data/models/post_model.dart';

abstract class PostRepository {
  ///RU:Получить все посты
  ///
  ///EN:Get all posts
  Future<PostDataModel> getAllPost();

   /// RU: Получение детальной информации по айди
  ///
  /// EN: Get post detail by id
  Future<PostPreview> getUserDetailById({required String id});
}
