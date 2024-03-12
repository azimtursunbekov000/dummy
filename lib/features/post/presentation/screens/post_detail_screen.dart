import 'package:dummy/features/post/data/repositories/post_repository_impl.dart';
import 'package:dummy/features/post/domain/use_cases/post_use_cases.dart';
import 'package:dummy/features/post/presentation/logic/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostDetailScreen extends StatelessWidget {
  final String id;

  const PostDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (context) => PostBloc(
        PostUseCases(
          postRepository: PostRepositoryImpl(),
        ),
      )..add(
          GetDetailPostByIdEvent(id: id),
        ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text("Детальная информация"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostDetailLoadedState) {
              final postPreview = state.postPreview;
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(postPreview.owner?.firstName ?? ''),
                      Image.network(
                        postPreview.imageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Text(postPreview.text),
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                          Text(
                            postPreview.likes.toString(),
                          ),
                          const Spacer(),
                          Text(
                            postPreview.tags.join(','),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
