import 'package:dummy/features/user/data/repositories/user_repository_impl.dart';
import 'package:dummy/features/user/domain/use_cases/user_use_cases.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:dummy/features/user/presentation/widgets/list_view_sp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is UserLoadedState) {
                return const SizedBox(
                  height: 812,
                  child: ListViewSeparatedContent(),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
