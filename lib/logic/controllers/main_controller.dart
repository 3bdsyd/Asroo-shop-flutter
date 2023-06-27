import 'package:asroo_shop/view/screens/category_screen.dart';
import 'package:asroo_shop/view/screens/favorites_screen.dart';
import 'package:asroo_shop/view/screens/settings_screen.dart';
import 'package:get/get.dart';

import '../../view/screens/home_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final screens = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;
}
