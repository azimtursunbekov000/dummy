import 'package:dummy/features/user/data/models/user_preview_model.dart';

abstract class UserRepository {
  /// RU: Получение всех пользователей
  ///
  /// EN: Getting all users
  Future<List<UserPreviewModel>> getAllUsers();


  /// RU: Получение детальной информации по айди пользователя
  ///
  /// EN: Getting user detail user by id
  Future<UserPreviewModel> getUserById ({required int id});

}