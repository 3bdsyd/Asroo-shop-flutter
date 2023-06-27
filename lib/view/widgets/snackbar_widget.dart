import 'package:get/get.dart';

import '../../utils/theme.dart';

void snackbarWidget({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    colorText: Get.isDarkMode ? mainColor : pinkClr,
    duration: const Duration(
      milliseconds: 1000,
    ),
    snackPosition: SnackPosition.BOTTOM,
  );
}
