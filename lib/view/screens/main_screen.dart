import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.scaffoldBackgroundColor,
            bottomNavigationBar: BottomNavigationBar(
              fixedColor: context.theme.primaryColor,
              unselectedItemColor: context.theme.highlightColor,
              elevation: 0,
              currentIndex: controller.currentIndex.value,
              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.category),
                  icon: Icon(Icons.category),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.favorite),
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  activeIcon: Icon(Icons.settings),
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              // ignore: invalid_use_of_protected_member
              children: controller.screens.value,
            ),
          );
        },
      ),
    );
  }
}
