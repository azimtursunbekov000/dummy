import 'package:dummy/features/settings/presentation/screens/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ThemeWidget extends StatefulWidget {
  const ThemeWidget({Key? key}) : super(key: key);

  @override
  _ThemeWidgetState createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  bool _isDarkThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Темная тема"),
              Text(
                _isDarkThemeEnabled ? "Включена" : "Выключена",
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Выберите режим темы'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Включить темную тему'),
                          leading: Radio(
                            value: true,
                            groupValue: _isDarkThemeEnabled,
                            onChanged: (bool? value) {
                              setState(() {
                                _isDarkThemeEnabled = value!;
                                Provider.of<ThemeManager>(context,
                                        listen: false)
                                    .changeTheme(value
                                        ? ThemeType.black
                                        : ThemeType.light);
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Выключить темную тему'),
                          leading: Radio(
                            value: false,
                            groupValue: _isDarkThemeEnabled,
                            onChanged: (bool? value) {
                              setState(() {
                                _isDarkThemeEnabled = value!;
                                Provider.of<ThemeManager>(context,
                                        listen: false)
                                    .changeTheme(value!
                                        ? ThemeType.black
                                        : ThemeType.light);
                              });
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
