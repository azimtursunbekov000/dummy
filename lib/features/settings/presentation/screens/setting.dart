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
            const Divider(),
            const Text(
              "Внешний вид",
            ),
            const ThemeWidget(),
            SizedBox(height: 30.h),
            const Expanded(
              flex: -1,
              child: Text(
                "О приложении",
              ),
            ),
            SizedBox(height: 10.h),
            const Expanded(
              flex: -1,
              child: Text("."),
            ),
            SizedBox(height: 30.h),
            const Expanded(
              flex: -1,
              child: Divider(),
            ),
            const Expanded(
              flex: -1,
              child: Text(
                "Версия приложения",
              ),
            ),
            SizedBox(height: 10.h),
            const Expanded(
              flex: -1,
              child: Text(
                "Dummy  v1.0.0",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
