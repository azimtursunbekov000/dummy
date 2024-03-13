import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dummy/features/settings/presentation/screens/theme_manager.dart';
import 'package:dummy/features/post/data/repositories/post_repository_impl.dart';
import 'package:dummy/features/post/domain/use_cases/post_use_cases.dart';
import 'package:dummy/features/post/presentation/logic/bloc/post_bloc.dart';
import 'package:dummy/features/user/data/repositories/user_repository_impl.dart';
import 'package:dummy/features/user/domain/use_cases/user_use_cases.dart';
import 'package:dummy/features/user/presentation/logic/bloc/user_bloc.dart';
import 'package:dummy/internal/components/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeManager = ThemeManager();
  await themeManager.loadTheme();

  runApp(
    ChangeNotifierProvider.value(
      value: themeManager,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            BlocProvider<UserBloc>(
              create: (context) => UserBloc(
                UserUseCase(
                  userRepository: UserRepositoryImpl(),
                ),
              ),
            ),
            BlocProvider<PostBloc>(
              create: (context) => PostBloc(
                PostUseCases(
                  postRepository: PostRepositoryImpl(),
                ),
              ),
            ),
          ],
          child: Builder(
            builder: (context) {
              final themeManager = Provider.of<ThemeManager>(context);
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: themeManager.currentTheme,
                routerConfig: router,
              );
            },
          ),
        );
      },
    );
  }
}
