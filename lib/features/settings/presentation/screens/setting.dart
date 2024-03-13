import 'package:dummy/features/settings/presentation/screens/theme_manager.dart';
import 'package:dummy/internal/components/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        children: [
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Настройки',
                  style: TextStyle(
                    fontSize: 20,
                    color: themeProvider.changeTextColor(),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.h),
              
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ВНЕШНИЙ ВИД',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Icon(
                    Icons.format_paint_rounded,
                    size: 30,
                    color: themeProvider.changeTextColor(),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Темная тема',
                        style: TextStyle(
                          color: themeProvider.changeTextColor(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16.w),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        context.read<ThemeProvider>().changeTheme();
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                      color: themeProvider.changeTextColor(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 36.h),
              Divider(),
              SizedBox(height: 36.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'О ПРИЛОЖЕНИИ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
                style: TextStyle(
                  color: themeProvider.changeTextColor(),
                ),
              ),
              SizedBox(height: 36.h),
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ВЕРСИЯ ПРИЛОЖЕНИЯ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rick & Morty v1.0.0',
                  style: TextStyle(
                    color: themeProvider.changeTextColor(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
