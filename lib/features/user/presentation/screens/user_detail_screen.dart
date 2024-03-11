import 'package:dummy/features/user/data/repositories/user_repository_impl.dart';
import 'package:dummy/features/user/domain/use_cases/user_use_cases.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:dummy/features/user/presentation/widgets/user_detail_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailScreen extends StatelessWidget {
  final String id;

  const UserDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc(
        UserUseCase(
          userRepository: UserRepositoryImpl(),
        ),
      )..add(
          GetUserByIdEvent(id: id),
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
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserDetailLoadedState) {
              final userFullList = state.userPreview;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        maxRadius: 60.0.r,
                        minRadius: 10.0.r,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                          userFullList.picture ?? '',
                        ),
                      ),
                    ),
                    // Text(userFullList.phone ?? ''),
                    Text(userFullList.firstName),
                    Text(userFullList.lastName),
                    SizedBox(height: 10.h),
                    Container(
                      width: double.infinity,
                      child: const UserDetailContentWidget(),
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        "Добавить комментарий ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
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
