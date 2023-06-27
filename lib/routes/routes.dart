import 'package:asroo_shop/logic/bindings/main_binding.dart';
import 'package:asroo_shop/logic/bindings/product_binding.dart';
import 'package:asroo_shop/view/screens/auth/forgot_password_screen.dart';
import 'package:asroo_shop/view/screens/auth/login_screen.dart';
import 'package:asroo_shop/view/screens/splash_screen.dart';
import 'package:asroo_shop/view/screens/welcome_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../logic/bindings/auth_binding.dart';
import '../logic/bindings/cart_binding.dart';
import '../view/screens/auth/sign_up_screen.dart';
import '../view/screens/cart_screen.dart';
import '../view/screens/main_screen.dart';

class RoutesApp {
    static const splashScreen = RoutesName.splashScreen;
  static const welcome = RoutesName.welcomeScreen;
  static const mainScreen = RoutesName.mainScreen;
  static final List<GetPage> getPages = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RoutesName.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: RoutesName.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesName.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesName.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: RoutesName.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
        CartBinding(),
      ],
    ),
    GetPage(
      name: RoutesName.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        CartBinding(),
      ],
    ),
  ];
}

class RoutesName {
  static const String splashScreen = '/splashScreen';
  static const String welcomeScreen = '/welcomeScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String loginScreen = '/loginScreen';
  static const String mainScreen = '/mainScreen';
  static const String cartScreen = '/cartScreen';
}
