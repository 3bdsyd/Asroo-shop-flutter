
import 'package:asroo_shop/language/ar.dart';
import 'package:asroo_shop/language/en.dart';
import 'package:asroo_shop/language/fr.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class LocalizationsApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
