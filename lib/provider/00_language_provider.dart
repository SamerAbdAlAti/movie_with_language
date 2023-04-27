import 'dart:ui';

import 'package:flutter/cupertino.dart';

import '../prefs/00_shared_pref_controller.dart';

class LanguageProvider extends ChangeNotifier {
  String? cacheLanguage =
      SharedPrefController().getValueFor<String>(PrefKeys.language.name);

  String get language {
    String languageCode = window.locale.languageCode;
    String code =
        (languageCode == "en" || languageCode == "ar" || languageCode == "zh")
            ? languageCode
            : "en";
    return cacheLanguage ?? code;
  }

  set language(String value) {
    cacheLanguage = value;
  }

  void changeLanguage({required String languageCode}) {
    language = languageCode;

    SharedPrefController().changeLanguage(langCode: languageCode);
    notifyListeners();
  }
}
