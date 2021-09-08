import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

extension TextStyleOpacity on TextStyle {
  TextStyle copyWithOpacity(double opacity) {
    return copyWith(
      color: color?.withOpacity(opacity),
    );
  }

  TextStyle get highEmphasis => copyWithOpacity(0.87);
  TextStyle get mediumEmphasis => copyWithOpacity(0.6);
  TextStyle get disabledEmphasis => copyWithOpacity(0.38);

  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get extraLigth => copyWith(fontWeight: FontWeight.w200);
  TextStyle get ligth => copyWith(fontWeight: FontWeight.w300);
  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get blackBold => copyWith(fontWeight: FontWeight.w900);
}

extension ThemeModeIcon on ThemeMode {
  IconData get icon {
    switch (this) {
      case ThemeMode.system:
        return FluentIcons.settings_20_regular;
      case ThemeMode.light:
        return FluentIcons.weather_sunny_20_regular;

      case ThemeMode.dark:
        return FluentIcons.weather_moon_20_regular;
    }
  }

  String toLocalString(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return 'System';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }
}


extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextTheme get accentTextTheme => Theme.of(this).accentTextTheme;
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;
}



