import 'package:asroo_shop/utils/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{
  final GetStorage themeBox = GetStorage();
  final String themeKey = 'themeKey';
  
  void saveThemeModeInBox(bool isDarkMode) {
    themeBox.write(themeKey, isDarkMode);
  }

  bool getThemeModeFromBox() {
    return themeBox.read<bool>(themeKey) ?? Get.isDarkMode;
  }

  void changeThemeMode() {
    Get.changeTheme(getThemeModeFromBox() ? ThemeApp.dark : ThemeApp.light);
    saveThemeModeInBox(!getThemeModeFromBox());
  }
}
