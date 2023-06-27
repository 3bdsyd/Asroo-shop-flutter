import 'package:asroo_shop/logic/controllers/auth_controller.dart';
import 'package:asroo_shop/logic/controllers/cart_controller.dart';
import 'package:asroo_shop/logic/controllers/theme_controller.dart';
import 'package:asroo_shop/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import '../../logic/controllers/settings_controller.dart';
import '../../routes/routes.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final SettingsController settingsController = Get.put(SettingsController());
  final CartController controllerCart = Get.find<CartController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        title: const TextUtils(
          text: 'Settings',
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 22,
          decoration: TextDecoration.none,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => badges.Badge(
                position: badges.BadgePosition.topEnd(top: -5, end: -5),
                badgeContent: Text('${controllerCart.productsMap.length}'),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(RoutesName.cartScreen);
                  },
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://www.catholicsingles.com/wp-content/uploads/2020/06/blog-header-3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextUtils(
                          text: 'Abdulrahman Al-Sayed',
                          fontWeight: FontWeight.bold,
                          color: context.theme.highlightColor,
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 3),
                      SizedBox(
                        width: 200,
                        child: TextUtils(
                          text: 'mr.aaa48@gmail.com',
                          fontWeight: FontWeight.w500,
                          color: context.theme.highlightColor,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Divider(
                thickness: 2,
                endIndent: 20,
                height: 30,
                color: context.theme.highlightColor,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  TextUtils(
                    text: 'GENERAL'.tr,
                    fontWeight: FontWeight.normal,
                    color: context.theme.primaryColor,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 96, 52, 216),
                    ),
                    child: const Icon(
                      Icons.dark_mode,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  TextUtils(
                    text: 'Dark Mode'.tr,
                    fontWeight: FontWeight.bold,
                    color: context.theme.highlightColor,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Switch(
                      value: !ThemeController().getThemeModeFromBox(),
                      onChanged: (val) {
                        ThemeController().changeThemeMode();
                      },
                      activeColor: context.theme.primaryColor,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 224, 48, 48),
                    ),
                    child: const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  TextUtils(
                    text: 'Language'.tr,
                    fontWeight: FontWeight.bold,
                    color: context.theme.highlightColor,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                  Container(
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: context.theme.highlightColor, width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: settingsController.lan,
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: context.theme.primaryColor,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: context.theme.highlightColor,
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'en',
                            child: Text(
                              'English 🇺🇸',
                              style: TextStyle(
                                color: context.theme.highlightColor,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'ar',
                            child: Text(
                              'Arabic 🇸🇾',
                              style: TextStyle(
                                color: context.theme.highlightColor,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'fr',
                            child: Text(
                              'France 🇫🇷',
                              style: TextStyle(
                                color: context.theme.highlightColor,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          settingsController.changeLanguage(value!);
                          Get.updateLocale(Locale(value));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 124, 156, 245),
                    ),
                    child: const Icon(
                      Icons.login_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      authController.signOut();
                    },
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextUtils(
                          text: 'Logout'.tr,
                          fontWeight: FontWeight.bold,
                          color: context.theme.highlightColor,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
