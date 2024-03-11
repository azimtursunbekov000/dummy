import 'package:dummy/features/user/data/models/user_preview_model.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCreateScreen extends StatelessWidget {
  const UserCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController idController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController pictureController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController dateOfBirthController = TextEditingController();
    final TextEditingController registerDateController =
        TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController streetController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController timezoneController = TextEditingController();

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
              controller: pictureController,
              decoration: InputDecoration(labelText: 'Изображение'),
            ),
            TextFormField(
              controller: genderController,
              decoration: InputDecoration(labelText: 'Пол'),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: dateOfBirthController,
              decoration: InputDecoration(labelText: 'Дата рождения'),
            ),
            TextFormField(
              controller: registerDateController,
              decoration: InputDecoration(labelText: 'Дата регистрации'),
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Телефон'),
            ),
            TextFormField(
              controller: streetController,
              decoration: InputDecoration(labelText: 'Улица'),
            ),
            TextFormField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'Город'),
            ),
            TextFormField(
              controller: stateController,
              decoration: InputDecoration(labelText: 'Область'),
            ),
            TextFormField(
              controller: countryController,
              decoration: InputDecoration(labelText: 'Страна'),
            ),
            TextFormField(
              controller: timezoneController,
              decoration: InputDecoration(labelText: 'Часовой пояс'),
            ),

            ElevatedButton(
              onPressed: () {
                final Location newUserLocation = Location(
                  street: streetController.text,
                  city: cityController.text,
                  state: stateController.text,
                  country: countryController.text,
                  timezone: timezoneController.text,
                );

                final UserPreview newUser = UserPreview(
                  id: idController.text,
                  title: titleController.text,
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  phone: phoneController.text,
                  picture: pictureController.text,
                  gender: genderController.text,
                  email: emailController.text,
                  dateOfBirth: dateOfBirthController.text,
                  registerDate: registerDateController.text,
                  location: newUserLocation,
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
