import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:dummy/features/user/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<UserDataModel> getAllUsers() async {
    return await userRepository.getAllUsers();
  }

  Future<UserPreview> getUserDetailById({required String id}) async {
    return await userRepository.getUserDetailById(id: id);
  }

  Future<void> createUser({required UserPreview user}) async {
    return await userRepository.createUser(user: user);
  }
}
