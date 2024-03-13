import 'package:dummy/internal/components/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = false;

  ThemeData theme = ThemeData();

  Color changeTextColor() {
    return isDarkTheme ? Colors.white : Colors.black;
  }

  Color changeTextFieldColor() {
    return isDarkTheme ? Color(0xff0B1E2D) : Colors.white;
  }

  Color changeContainerColor() {
    return isDarkTheme ? Color(0xff0B1E2D) : Colors.white;
  }

  void changeTheme() {
    isDarkTheme = !isDarkTheme;

    theme = ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColor,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDarkTheme ? AppColors.darkBgColor : AppColors.lightBgColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            isDarkTheme ? AppColors.darkNavBarBgColor : AppColors.lightBgColor,
      ),
    );
    notifyListeners();
  }
}
