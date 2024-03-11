import 'package:dummy/features/post/data/models/post_model.dart';
import 'package:dummy/features/post/domain/repositories/post_repository.dart';

class PostUseCases {
  final PostRepository postRepository;

  PostUseCases({required this.postRepository});

  Future<PostDataModel> getAllPost() async {
    return await postRepository.getAllPost();
  }

  Future<PostPreview> getPostById({required String id}) async {
    return await postRepository.getUserDetailById(id: id);
  }
}
