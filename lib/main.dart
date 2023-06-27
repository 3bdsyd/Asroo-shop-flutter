import 'package:asroo_shop/language/localiztion.dart';
import 'package:asroo_shop/logic/controllers/theme_controller.dart';
import 'package:asroo_shop/routes/routes.dart';
import 'package:asroo_shop/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'language/en.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeController().getThemeModeFromBox()
          ? ThemeApp.light
          : ThemeApp.dark,
      debugShowCheckedModeBanner: false,
      locale: Locale(
        GetStorage().read<String>("language").toString(),
      ),
      translations: LocalizationsApp(),
      fallbackLocale: Locale(ene),
      initialRoute: GetStorage().read<bool>('authKey') ?? false
          ? RoutesName.mainScreen
          : RoutesName.splashScreen,
      getPages: RoutesApp.getPages,
    );
  }
}
