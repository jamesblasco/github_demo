import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/resources.dart';

class Themes {
  static final theme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: adaptivePlatformDensity,
    primaryTextTheme: Typography.englishLike2018.apply(
        displayColor: Colors.black, bodyColor: Colors.black.withOpacity(0.8)),
    accentTextTheme: Typography.englishLike2018.apply(
        displayColor: Colors.white, bodyColor: Colors.white.withOpacity(0.8)),
    textTheme: Typography.englishLike2018.apply(
        displayColor: Colors.black, bodyColor: Colors.black.withOpacity(0.8)),
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    visualDensity: adaptivePlatformDensity,
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    cardTheme: CardTheme(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
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
    const EdgeInsetsGeometry scaledPadding =
        EdgeInsets.symmetric(horizontal: 16, vertical: 12);
    return TextButton.styleFrom(
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: edgeInsets ?? scaledPadding,
        //visualDensity: VisualDensity.comfortable,
        backgroundColor: color.asPlainBackground(0.1),
        primary: color,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap);
  }

  static ButtonStyle icon(Color color,
      {EdgeInsets? edgeInsets, bool dense = false}) {
    final double margin = dense ? 8 : 12;
    final EdgeInsets scaledPadding =
        EdgeInsets.symmetric(horizontal: margin, vertical: margin);
    return from(
      color,
      edgeInsets ?? scaledPadding,
    );
  }

  static ButtonStyle primary(BuildContext context, [EdgeInsets? edgeInsets]) {
    const EdgeInsetsGeometry scaledPadding =
        EdgeInsets.symmetric(horizontal: 16, vertical: 12);
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
