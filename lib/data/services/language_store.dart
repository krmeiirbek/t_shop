import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageStore extends GetxController {
  static LanguageStore get instance => Get.find();

  final _language = "kz".obs;
  final _country = "KZ".obs;

  Locale get locale => Locale(_language.value, _country.value);

  @override
  void onInit() {
    final languageCode = GetStorage().read('languageCode') as String?;
    final countryCode = GetStorage().read('countryCode') as String? ?? "";
    if (languageCode != null) {
      _language.value = languageCode;
      _country.value = countryCode;
    } else {
      _language.value = 'kz';
      _country.value = 'KZ';
    }

    super.onInit();
  }

  Future<void> setLanguage(Locale locale) async {
    await GetStorage().write('languageCode', locale.languageCode);
    await GetStorage().write('countryCode', locale.countryCode ?? "");
    _language.value = locale.languageCode;
    _country.value = locale.countryCode ?? "";
  }
}
