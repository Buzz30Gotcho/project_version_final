import 'package:flutter/material.dart';
import 'package:proximity/config/config.dart';
import 'package:proximity_client/domain/data_persistence/data_persistence.dart';

class UserSettings with ChangeNotifier {
  Locale? _locale;
  late String _theme;

  UserSettings() {
    _locale = null;
    _theme = '';
    _loadSettings();
  }

  // Getters
  Locale? get locale => _locale;

  String get theme => _theme;

  // Setters
  changeLocale(Locale locale) {
    if (!locales.contains(locale)) return;

    _locale = locale;
    _saveSettings();
    notifyListeners();
  }

  changeTheme(String theme) {
    _theme = theme;

    _saveSettings();
    notifyListeners();
    //_loadSettings();
  }

  _saveSettings() async {
    var settingsBox = Boxes.getSettingsBox();
    settingsBox.put('theme', _theme);
    if (_locale!=null){
    settingsBox.put('locale_language', _locale!.languageCode);
    settingsBox.put('locale_country', _locale!.countryCode);
  }
  }

  _loadSettings() async {
    var settingsBox = Boxes.getSettingsBox();
    String theme = settingsBox.get('theme') ?? "";
    Locale? locale = (settingsBox.get('locale_language') != null &&
            settingsBox.get('locale_country') != null)
        ? Locale(settingsBox.get('locale_language'),
            settingsBox.get('locale_country'))
        : null;
    changeTheme(theme);
    if (locale != null) changeLocale(locale);
  }
}
