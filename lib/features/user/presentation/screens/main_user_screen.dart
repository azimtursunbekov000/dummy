import 'package:dummy/features/user/data/repositories/user_repository_impl.dart';
import 'package:dummy/features/user/domain/use_cases/user_use_cases.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:dummy/features/user/presentation/screens/user_create_screen.dart';
import 'package:dummy/features/user/presentation/widgets/list_view_sp_widget.dart';
import 'package:dummy/features/user/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainUserScreen extends StatelessWidget {
  const MainUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        UserUseCase(
          userRepository: UserRepositoryImpl(),
        ),
      )..add(
          GetAllUserEvent(),
        ),
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.only(top: 80.h, bottom: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SearchWidget(),
              SizedBox(height: 10.h),
              Expanded(
                child: BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is UserLoadedState) {
                      return const ListViewSeparatedContent();
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) => const UserCreateScreen(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
