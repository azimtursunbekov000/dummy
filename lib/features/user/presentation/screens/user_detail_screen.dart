import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dummy/features/user/domain/use_cases/user_use_cases.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:dummy/features/user/data/repositories/user_repository_impl.dart';

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
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text("Детальная информация"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserDetailLoadedState) {
              final userModelList = state.userFullList;
              return Column(
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        image: DecorationImage(
                          image:
                              NetworkImage(userModelList.userFull?.email ?? ''),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              // Если состояние не загружено, можно показать индикатор загрузки или что-то еще
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
