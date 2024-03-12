import 'package:bloc/bloc.dart';
import 'package:dummy/features/post/data/models/post_model.dart';
import 'package:dummy/features/post/domain/use_cases/post_use_cases.dart';
import 'package:dummy/internal/helpers/catch_exception.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostUseCases postUseCases;
  PostBloc(this.postUseCases) : super(PostInitialState()) {
    on<GetAllPostEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final PostDataModel postModel = await postUseCases.getAllPost();
        emit(PostLoadedState(postPreview: postModel));
      } catch (e) {
        print("error post bloc $e");
        emit(PostErrorState(error: CatchException.convertException(e)));
      }
    });


    on<GetDetailPostByIdEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        final PostPreview postModel = await postUseCases.getPostById(id: event.id);
        emit(PostDetailLoadedState(postPreview: postModel));
      } catch (e) {
        print("error post bloc $e");
        emit(PostErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
