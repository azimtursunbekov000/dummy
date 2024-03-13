import 'package:dummy/features/settings/presentation/widgets/theme_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80.h,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    child: Image.network(
                      "https://img.freepik.com/premium-vector/user-profile-icon-flat-style-member-avatar-vector-illustration-isolated-background-human-permission-sign-business-concept_157943-15752.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(height: 36.h),
            Divider(),
            Text(
              "Внешний вид",
            ),
            const BlackThemeWidget(),
            SizedBox(height: 30.h),
            Expanded(
              flex: -1,
              child: Text(
                "О приложении",
              ),
            ),
            SizedBox(height: 10.h),
            const Expanded(
              flex: -1,
              child: Text(
                  "Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концентрированной темной материи."),
            ),
            SizedBox(height: 30.h),
            Expanded(
              flex: -1,
              child: Divider(),
            ),
            Expanded(
              flex: -1,
              child: Text(
                "Версия приложения",
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              flex: -1,
              child: Text(
                "Rick & Morty  v1.0.0",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
