import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/foundation.dart';
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

VisualDensity get adaptivePlatformDensity {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.iOS:
    case TargetPlatform.fuchsia:
      break;
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      return VisualDensity.comfortable;
  }
  return const VisualDensity();
}


class ButtonStyles {
  static ButtonStyle from(Color color, [EdgeInsets? edgeInsets]) {
    const EdgeInsetsGeometry scaledPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    return TextButton.styleFrom(
      minimumSize: Size.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: edgeInsets ?? scaledPadding,
      //visualDensity: VisualDensity.comfortable,
      backgroundColor: color.asPlainBackground(0.1),
      primary: color,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap
    );
  }

  static ButtonStyle icon(Color color, {EdgeInsets? edgeInsets, bool dense = false}) {
    final double margin = dense ? 8 : 12;
    final EdgeInsets scaledPadding = EdgeInsets.symmetric(horizontal: margin, vertical: margin);
    return from(
      color,
      edgeInsets ?? scaledPadding,
    );
  }

  static ButtonStyle primary(BuildContext context, [EdgeInsets? edgeInsets]) {
    const EdgeInsetsGeometry scaledPadding =  EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    final theme = Theme.of(context);
    final color = theme.primaryColor;
    return TextButton.styleFrom(
      minimumSize: Size.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: edgeInsets ?? scaledPadding,
      //visualDensity: VisualDensity.comfortable,
      backgroundColor: color,
      primary: theme.accentTextTheme.bodyText1?.color,
    );
  }
}



extension ColorHSL on Color {
  /// Returns a copy of this color with the [hue] parameter replaced with the
  /// given value.
  Color withHue(double hue) {
    return HSLColor.fromColor(this).withHue(hue).toColor();
  }

  /// Returns a copy of this color with the [saturation] parameter replaced with
  /// the given value.
  Color withSaturation(double saturation) {
    return HSLColor.fromColor(this).withSaturation(saturation).toColor();
  }

  /// Returns a copy of this color with the [lightness] parameter replaced with
  /// the given value.
  Color withLightness(double lightness) {
    return HSLColor.fromColor(this).withLightness(lightness).toColor();
  }

  /// Returns a copy of this color with the [lightness] parameter replaced with
  /// the given value.
  Color asBackground(BuildContext context, [double opacity = 0.05]) {
    final brightness = Theme.of(context).brightness;
    final lightness = brightness == Brightness.dark ? 0.8 : 0.5;
    return HSLColor.fromColor(this).fixSaturation().withLightness(lightness).toColor().withOpacity(opacity);
  }

  Color asPlainBackground([double opacity = 0.05, Brightness? brightness]) {
    final lightness = brightness == Brightness.dark ? 0.8 : 0.5;
    return HSLColor.fromColor(this).fixSaturation().withLightness(lightness).toColor().withOpacity(opacity);
  }
}


extension on HSLColor {
 HSLColor fixSaturation() {
    return withSaturation(lightness == 0 ?  0 : saturation);
  }
}

Color hexToColor(String code) {
  return  Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}