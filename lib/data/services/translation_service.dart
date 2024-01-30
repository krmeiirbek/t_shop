import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localization/kz_KZ.g.dart';
import '../../localization/ru_RU.g.dart';
import 'language_store.dart';

class TranslationService extends Translations {
  static Locale? get locale => LanguageStore.instance.locale;
  static const fallbackLocale = Locale('kz', 'KZ');

  @override
  Map<String, Map<String, String>> get keys => {
        'kz_KZ': kzKZ,
        'ru_RU': ruRU,
      };
}
