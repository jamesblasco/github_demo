import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/src/modules/login/login_page.dart';
import 'package:github_demo/src/providers/auth_provider.dart';
import 'package:window_to_front/window_to_front.dart';
import 'package:github_demo/resources.dart';

class GithubAuthWall extends SingleChildStatelessWidget {
  const GithubAuthWall({
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    final logged = context.select((AuthGithubProvider p) => p.logged);
    final ready = context.select((AuthGithubProvider p) => p.ready);
    if (!ready) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (logged) {
      return child!;
    }

    return CupertinoTabView(
      builder: (context) => LoginPage(onLogin: () async {
        try {
          final authProvider = context.read<AuthGithubProvider>();
          assert(!authProvider.logged, 'User already logged');
          await authProvider.login(context);
          if ([
            TargetPlatform.linux,
            TargetPlatform.macOS,
            TargetPlatform.windows,
          ].contains(defaultTargetPlatform)) {
            WindowToFront.activate();
          }
        } catch (e) {
          showAlert(context, '$e');
          rethrow;
        }
      }),
    );
  }
}
