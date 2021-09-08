
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themeKey = 'Theme_Preferences';
const _readIssuesKey = 'Read_Issues';

class PreferencesRepository {
  const PreferencesRepository();

  Future<ThemeMode> readThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int value = prefs.getInt(_themeKey) ?? 0;
    assert(value <= 2, 'Theme mode index can only be 0,1,2');
    return ThemeMode.values[value];
  }

  Future<void> writeThemeMode(ThemeMode value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, value.index);
  }

  Future<List<String>> readReadIssues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_readIssuesKey) ?? [];
  }

  Future<void> writeReadIssues(List<String> ids) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_readIssuesKey, ids);
  }
}
