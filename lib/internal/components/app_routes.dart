import 'package:dummy/features/user/presentation/screens/main_user_screen.dart';
import 'package:dummy/features/user/presentation/screens/user_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainUserScreen();
      },
      routes: <RouteBase>[
        // GoRoute(
        //   path: RouterConstants.user_detail,
        //   builder: (BuildContext context, GoRouterState state) {
        //     return  UserDetailScreen(name: '',);
        //   },
        // ),
      ],
    ),
  ],
);

class RouterConstants {
  static String mainUser = '/main_user';
  static String user_detail = '/user_detail';
}
