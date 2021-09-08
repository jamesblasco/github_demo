
import 'package:flutter/material.dart';
import 'package:github_demo/src/providers/preferences_providers.dart';
import 'package:github_demo/src/utils/theme.dart';
import 'package:provider/provider.dart';

class ThemeSettingsPopup extends StatelessWidget {
  final Widget child;

  const ThemeSettingsPopup({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ThemeMode>(
      initialValue:
          context.watch<PreferencesProvider>().themeMode,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) => List<PopupMenuEntry<ThemeMode>>.from(ThemeMode
          .values.reversed
          .map<PopupMenuItem<ThemeMode>>((themeMode) => PopupMenuItem(
                value: themeMode,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        themeMode.icon,
                        size: 20,
                        color: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.color
                            ?.withOpacity(0.5),
                      ),
                      const SizedBox(width: 20),
                      Text(themeMode.toLocalString(context)),
                    ],
                  ),
                ),
              )))
        ..insert(2, const PopupMenuDivider(height: 0))
        ..insert(1, const PopupMenuDivider(height: 0)),
      onSelected: (ThemeMode themeMode) {
        context.read<PreferencesProvider>().updateThemeMode(themeMode);
      },
      child: child,
      padding:const EdgeInsets.all(0),
      offset: const Offset(400, -70),
    );
  }
}
