import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:dummy/features/user/data/repositories/user_repository_impl.dart';
import 'package:dummy/features/user/domain/use_cases/user_use_cases.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailScreen extends StatelessWidget {
  final int id;

  const UserDetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    final userFullList = (bloc.state as UserDetailLoadedState).userFullList;
    return BlocProvider(
      create: (context) =>
      UserBloc(
        UserUseCase(
          userRepository: UserRepositoryImpl(),
        ),
      )
        ..add(
          GetUserByIdEvent(id: id),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(''),
        ),
        body: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if(state is UserDetailLoadedState) {
              return Column(
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(""),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
