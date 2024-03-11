import 'package:dummy/features/user/data/models/user_preview_model.dart';

abstract class UserRepository {
  /// RU: Получение всех пользователей
  ///
  /// EN: Getting all users
  Future<UserDataModel> getAllUsers();

  /// RU: Получение детальной информации по  имени
  ///
  /// EN: Get user detail by name
  Future<UserPreview> getUserDetailById({required String id});

  ///RU: Создание пользователя
  ///
  ///EN:Create user
  Future<void> createUser({required UserPreview user});
}
