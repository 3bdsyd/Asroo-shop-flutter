import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../language/ar.dart';
import '../../language/en.dart';
import '../../language/fr.dart';

class SettingsController extends GetxController {
  String lan = 'en';
  GetStorage languageBox = GetStorage();
  @override
  void onInit() async {
    super.onInit();
    lan = await getLanguage;
  }

  saveLanguage(String language) async {
    await languageBox.write("language", language);
  }

  Future<String> get getLanguage async {
    return await languageBox.read("language") ?? 'en';
  }

  changeLanguage(String language) {
    saveLanguage(language);
    if (language == 'fr') {
      saveLanguage(frf);
      lan = frf;
    } else if (language == 'ar') {
      saveLanguage(ara);
      lan = ara;
    } else {
      saveLanguage(ene);
      lan = ene;
    }
    update();
  }
}
