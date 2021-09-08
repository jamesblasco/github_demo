import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:github_demo/src/modules/issues/pages/issues_page.dart';
import 'package:github_demo/src/providers/preferences_providers.dart';

import 'package:github_demo/src/services/auth/credentials_repository.dart';
import 'package:github_demo/src/services/auth/github_repository.dart';
import 'package:github_demo/src/services/preferences/preferences_repository.dart';
import 'package:github_demo/src/utils/theme.dart';
import 'package:github_demo/src/widgets/loading_screen.dart';

import 'package:layout/layout.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'src/providers/auth_provider.dart';
import 'src/providers/user_provider.dart';
import 'credentials.env.dart';
import 'src/modules/login/github_auth_wall.dart';
import 'src/services/github/github_repository.dart';

void main() {
  runApp(const GithubApp());
}

class GithubApp extends StatelessWidget {
  const GithubApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: GithubAuthRepository(
            githubClientId: githubClientId,
            githubClientSecret: githubClientSecret,
            githubScopes: githubScopes,
          ),
        ),
        ChangeNotifierProvider<AuthGithubProvider>(create: (context) {
          return AuthGithubProvider(
            repository: context.read<GithubAuthRepository>(),
            credentialsRepository: const AuthCredentialsRepository(
              storage: FlutterSecureStorage(),
            ),
          );
        }),
        Provider.value(value: const PreferencesRepository()),
        ChangeNotifierProvider(
          create: (context) => PreferencesProvider(
            repository: context.read<PreferencesRepository>(),
          ),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'GitHub GraphQL API Client',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: adaptivePlatformDensity,
            primaryTextTheme: Typography.englishLike2018.apply(
                displayColor: Colors.black,
                bodyColor: Colors.black.withOpacity(0.8)),
            accentTextTheme: Typography.englishLike2018.apply(
                displayColor: Colors.white,
                bodyColor: Colors.white.withOpacity(0.8)),
            textTheme: Typography.englishLike2018.apply(
                displayColor: Colors.black,
                bodyColor: Colors.black.withOpacity(0.8)),
            cardTheme: CardTheme(
              clipBehavior: Clip.antiAlias,
              elevation: 8,
              shadowColor: Colors.black38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          darkTheme: ThemeData(
            visualDensity: adaptivePlatformDensity,
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            cardTheme: CardTheme(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          themeMode: context.select((PreferencesProvider p) => p.themeMode),
          builder: (context, child) {
            return Layout(
              child: Nested(
                children: [
                  LoadingWall(
                    onStart: () {
                      return Future.wait<void>([
                        context.read<AuthGithubProvider>().silentLogin(),
                        context.read<PreferencesProvider>().load(),
                      ]);
                    },
                  ),
                  const GithubAuthWall(),
                  Provider<GithubRepository>(create: (context) {
                    return GithubRepository(
                      link: context.read<AuthGithubProvider>().link,
                    );
                  }),
                  ChangeNotifierProvider<UserProvider>(create: (context) {
                    final provider = UserProvider(
                      repository: context.read<GithubRepository>(),
                    );
                    provider.fetch();
                    return provider;
                  }),
                ],
                child: child,
              ),
            );
          },
          home: const IssuesPage(),
        );
      },
    );
  }
}
