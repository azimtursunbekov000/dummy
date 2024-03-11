import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailContentWidget extends StatelessWidget {
  const UserDetailContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    final userPreview = (bloc.state as UserDetailLoadedState).userPreview;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          buildRow('Пол', userPreview.gender ?? ''),
          buildRow('Номер телефона', userPreview.phone ?? ''),
          buildRow('Email', userPreview.email ?? ''),
          buildRow('Дата регистрации', userPreview.registerDate ?? ''),
          buildRow('Дата рождения', userPreview.dateOfBirth ?? ''),
          buildRow('Страна', userPreview.location?.country ?? ''),
          buildRow('Город', userPreview.location?.city ?? ''),
          buildRow('Часавой пояс', userPreview.location?.timezone ?? ''),
          // SizedBox(height: 5.h),
        ],
      ),
    );
  }
}

Widget buildRow(String label, String data) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
        ),
        Text(
          data,
        ),
      ],
    ),
  );
}
