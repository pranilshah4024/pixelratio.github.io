import 'package:flutter/material.dart';
import 'package:size_config/constants/pref_constants.dart';
import 'package:size_config/utils/user_preference.dart';

class AppStateNotifier extends ChangeNotifier {
  //
  bool isDarkMode = false;
  ThemeMode? selectedTheme;

  void setCurrentTheme() async {
    selectedTheme = await currentTheme();
    notifyListeners();
  }

  void updateTheme(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    saveTheme(isDarkMode);

    notifyListeners();
  }

  void saveTheme(bool isDarkMode) async {
    await UserPreference.putBool(PrefKeys.isDarkMode, isDarkMode);
    await currentTheme();
  }

  Future<ThemeMode> currentTheme() async {
    bool? selectedTheme =
        UserPreference.getBool(PrefKeys.isDarkMode, defValue: null);
    if (selectedTheme == null) {
      Brightness currentBrightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      currentBrightness == Brightness.dark
          ? isDarkMode = true
          : isDarkMode = false;
    }
    switch (selectedTheme) {
      case true:
        {
          isDarkMode = true;
          return ThemeMode.dark;
        }
      case false:
        {
          isDarkMode = false;
          return ThemeMode.light;
        }
      default:
        {
          return ThemeMode.system;
        }
    }
  }
}
