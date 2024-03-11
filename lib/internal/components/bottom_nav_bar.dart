import 'package:dummy/features/post/presentation/screens/post_screen.dart';
import 'package:dummy/features/settings/presentation/screens/setting.dart';
import 'package:dummy/features/user/presentation/screens/main_user_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarScreen> {
  int selectedIndex = 0;
  void onItemTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> screens = const [
    MainUserScreen(),
    MainPostScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black26,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Персонажи',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_post_office),
            label: 'Посты',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Настройки',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTab,
      ),
    );
  }
}
