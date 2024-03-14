import 'package:dummy/features/user/data/models/user_created_model.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCreateScreen extends StatelessWidget {
  const UserCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController dateOfBirthController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Создать пользователя'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Добавьте TextFormField для каждого поля ввода
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'Имя'),
            ),
            TextFormField(
              controller: lastNameController,
            ),

            TextFormField(
              controller: dateOfBirthController,
              decoration: InputDecoration(labelText: 'Дата рождения'),
            ),

            ElevatedButton(
              onPressed: () {
                final UserCreated newUser = UserCreated(
                  id: idController.text,
                  name: firstNameController.text,
                  job: dateOfBirthController.text,
                );
                BlocProvider.of<UserBloc>(context)
                    .add(CreateUserEvent(user: newUser));
                Navigator.pop(context);
              },
              child: Text('Создать пользователя'),
            ),
          ],
        ),
      ),
    );
  }
}
