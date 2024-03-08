import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:dummy/features/user/domain/repositories/user_repository.dart';

class UserUseCase {
  final UserRepository userRepository;

  UserUseCase({required this.userRepository});

  Future<DataModel> getAllUsers() async {
    return await userRepository.getAllUsers();
  }

  
}
