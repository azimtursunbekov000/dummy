import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dummy/features/user/presentation/screens/main_user_screen.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:dummy/features/user/domain/use_cases/user_use_cases.dart';
import 'package:dummy/features/user/data/repositories/user_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: false,
          ),
          home: const MainUserScreen(),
        );
      },
    );
  }
}
