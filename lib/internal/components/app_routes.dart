import 'package:dummy/features/user/presentation/screens/main_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/main_user',
  routes: <RouteBase>[
    GoRoute(
      path: '/main_user',
      builder: (BuildContext context, GoRouterState state) {
        return const MainUserScreen();
      },
    ),
    // GoRoute(
    //   path: '/main_user',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const MainUserScreen();
    //   },
    // ),
  ],
);

class RouterConstants {
  static String mainUser = '/main_user';
  static String user_detail = '/user_detail';
}
