
import 'package:flutter/material.dart';



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