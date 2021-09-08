import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/src/modules/settings/widgets/theme_mode_popup.dart';
import 'package:github_demo/src/providers/auth_provider.dart';
import 'package:github_demo/src/providers/preferences_providers.dart';
import 'package:github_demo/src/providers/user_provider.dart';
import 'package:github_demo/src/widgets/navigation_bar.dart';
import 'package:github_demo/resources.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = context.select((UserProvider p) => p.data);
    final imageUrl = userData?.viewer.avatarUrl.value;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverNavigationBar(
            title: Text('Settings'),
          ),
          SliverToBoxAdapter(
            child: FluidMargin(
              child: Card(
                child: ListTile(
                  leading: imageUrl == null
                      ? null
                      : CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                  title: Text(
                    userData?.viewer.name ?? '',
                    style: context.textTheme.headline6,
                  ),
                  subtitle: Text('@${userData?.viewer.login}'),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FluidMargin(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ThemeSettingsPopup(
                      child: ListTile(
                        leading: const Icon(FluentIcons.dark_theme_24_filled),
                        title: const Text('Theme mode'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              context
                                  .watch<PreferencesProvider>()
                                  .themeMode
                                  .toLocalString(context),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWithOpacity(0.5),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      title: Text(
                        'Log out',
                        style: TextStyle(color: context.theme.errorColor),
                      ),
                      onTap: () => context.read<AuthGithubProvider>().logout(),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
