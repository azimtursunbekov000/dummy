import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:dummy/features/user/presentation/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewSeparatedContent extends StatelessWidget {
  const ListViewSeparatedContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    final userModelList = (bloc.state as UserLoadedState).userModelList;

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: userModelList.data.length,
      itemBuilder: (context, index) {
        return Container(
          height: 60.h,
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
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
              CircleAvatar(
                maxRadius: 30.0.r,
                minRadius: 10.0.r,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  userModelList.data[index].picture ?? '',
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(userModelList.data[index].firstName),
                  Text(userModelList.data[index].lastName),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailScreen(
                        id: userModelList.data[index].id,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 10.h);
      },
    );
  }
}
