import 'package:dummy/features/post/data/repositories/post_repository_impl.dart';
import 'package:dummy/features/post/domain/use_cases/post_use_cases.dart';
import 'package:dummy/features/post/presentation/logic/bloc/post_bloc.dart';
import 'package:dummy/features/post/presentation/widgets/post_list_view_widget.dart';
import 'package:dummy/features/user/presentation/screens/user_create_screen.dart';
import 'package:dummy/features/user/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPostScreen extends StatelessWidget {
  const MainPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(
        PostUseCases(
          postRepository: PostRepositoryImpl(),
        ),
      )..add(
          GetAllPostEvent(),
        ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 80.h, bottom: 10.h),
          child: RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<PostBloc>(context).add(GetAllPostEvent());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SearchWidget(),
                SizedBox(height: 10.h),
                Expanded(
                  child: BlocConsumer<PostBloc, PostState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is PostLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is PostLoadedState) {
                        return PostListViewWidget();
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "btn1",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserCreateScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
