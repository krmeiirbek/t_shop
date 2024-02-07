import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/language_store.dart';
import 'package:t_store/data/services/translation_service.dart';

class LanguageController extends GetxController {
  static LanguageController get instance => Get.find();
  final currentLanguage = 'kz_KZ'.obs;
  final languageStore = LanguageStore.instance;

  @override
  void onReady() {
    final currentLanguage = '${TranslationService.locale?.languageCode}_${TranslationService.locale?.countryCode}';
    this.currentLanguage.value = currentLanguage;
    super.onReady();
  }

  final Map<String, String> languageNames = {
    'kz_KZ': 'Қазақша',
    'ru_RU': 'Русский',
  };

  void changeLocale(String locale) async {
    var code = locale.split('_');
    Get.updateLocale(Locale(code[0], code[1]));
    await languageStore.setLanguage(Locale(code[0], code[1]));
    currentLanguage.value = locale;
  }
}
