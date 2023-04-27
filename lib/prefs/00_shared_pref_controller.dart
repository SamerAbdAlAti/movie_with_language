import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  language,
}

class SharedPrefController {
  SharedPrefController._();

  static SharedPrefController? _instance;

  late SharedPreferences? _sharedPreferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void changeLanguage({required String langCode}) async {
    _sharedPreferences!.setString(PrefKeys.language.name, langCode);
  }

  T? getValueFor<T>(String key) {
    if (_sharedPreferences!.containsKey(key)) {
      return _sharedPreferences!.get(key) as T;
    }
    return null;
  }


}
