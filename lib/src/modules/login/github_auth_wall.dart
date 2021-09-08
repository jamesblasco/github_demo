// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/src/modules/login/login_page.dart';
import 'package:github_demo/src/providers/auth_provider.dart';

import 'package:github_demo/src/utils/alert.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:window_to_front/window_to_front.dart';

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
      builder:(context)=>
    LoginPage(onLogin: () async {
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
    }),);
  }
}
