
import 'package:flutter/material.dart';
import 'package:github_demo/src/services/preferences/preferences_repository.dart';

class PreferencesProvider extends ChangeNotifier {
  final PreferencesRepository repository;

  PreferencesProvider({
    required this.repository,
  });

  ThemeMode? _themeMode;
  ThemeMode get themeMode => _themeMode ?? ThemeMode.system;

  bool _ready = false;
  bool get ready => _ready;

  Future<void> load() async {
    _themeMode = await repository.readThemeMode();
    _ready = true;
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode value) async {
    if (value == _themeMode) return;
    await repository.writeThemeMode(value);
    _themeMode = value;
    notifyListeners();
  }
}
