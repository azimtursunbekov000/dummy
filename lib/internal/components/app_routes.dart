import 'package:dummy/internal/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/bottom_nav_bar',
  routes: <RouteBase>[
    GoRoute(
      path: '/bottom_nav_bar',
      builder: (BuildContext context, GoRouterState state) {
        return const BottomNavBarScreen();
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
  static String bottom_nav_bar = '/bottom_nav_bar';
}
