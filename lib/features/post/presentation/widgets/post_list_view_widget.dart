import 'package:dummy/features/post/presentation/logic/bloc/post_bloc.dart';
import 'package:dummy/features/post/presentation/screens/post_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostListViewWidget extends StatelessWidget {
  const PostListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PostBloc>();
    final postPreviewList = (bloc.state as PostLoadedState).postPreview;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: postPreviewList.data.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 1,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: 10.w),
                const Text('Пост от:'),
                SizedBox(width: 10.w),
                Text(
                    '${postPreviewList.data[index].owner?.title} ${postPreviewList.data[index].owner?.firstName ?? 'что-то пошло не так'}'),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostDetailScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          );
        },
        separatorBuilder: ((context, index) {
          return SizedBox(height: 10.h);
        }),
      ),
    );
  }
}
