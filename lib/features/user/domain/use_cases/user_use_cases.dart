import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:dummy/features/user/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<List<UserPreviewModel>> getAllUsers() async {
    return await userRepository.getAllUsers();
  }

  Future<UserPreviewModel> getUserById({required int id}) async {
    return await userRepository.getUserById(id: id);
  }
}
