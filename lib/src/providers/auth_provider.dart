import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/src/modules/login/auth_page.dart';
import 'package:github_demo/src/services/auth/credentials_repository.dart';
import 'package:github_demo/src/services/auth/github_repository.dart';

import 'package:gql_http_link/gql_http_link.dart';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';

class AuthGithubProvider extends ChangeNotifier {
  final GithubAuthRepository repository;
  final AuthCredentialsRepository credentialsRepository;

  AuthGithubProvider({
    required this.repository,
    required this.credentialsRepository,
  });

  http.Client? _authClient;
  http.Client get authClient {
    assert(
        logged, 'Client is not authorized, use `logged` to check the status');
    return _authClient!;
  }

  HttpLink get link {
    return HttpLink(
      'https://api.github.com/graphql',
      httpClient: authClient,
    );
  }

  bool get logged => _authClient != null;

  HttpServer? _redirectServer;

  bool _ready = false;
  bool get ready => _ready;

  Future<void> silentLogin() async {
    final credentials = await credentialsRepository.readAuthCredentials();
    if (credentials != null) {
      _authClient = await repository.getClientForCredentials(credentials);
    }
    _ready = true;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    final grant = repository.getGrant();

    if ([TargetPlatform.macOS, TargetPlatform.linux, TargetPlatform.windows]
        .contains(defaultTargetPlatform)) {
      await _redirectServer?.close();
      // Bind to an ephemeral port on localhost
      _redirectServer = await HttpServer.bind('localhost', 0);
      final redirectUrl =
          Uri.parse('http://localhost:${_redirectServer?.port ?? '8000'}/auth');
      final authorizationUrl =
          repository.getAuthorizationUrl(grant, redirectUrl);

      await _redirect(authorizationUrl);
      final responseQueryParameters = await _listen();
      _authClient = await repository.getClientForAuthResponse(
          grant, responseQueryParameters);
    } else {
      final redirectUrl = Uri.parse('http://localhost:8000/auth');
      var authorizedResult = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => GitHubSignInPage(
            url: repository.getAuthorizationUrl(grant, redirectUrl).toString(),
            redirectUrl: redirectUrl.toString(),
            clearCache: false,
          ),
        ),
      );
      String? code = authorizedResult;
      _authClient = await repository.getClientForAuthResponse(grant, {
        'code': code!,
      });
    }
    final credentials = repository.getCredentialsForClient(_authClient!);
    if (credentials != null) {
      await credentialsRepository.writeAuthCredentials(credentials);
    }
    notifyListeners();
  }

  Future<void> _redirect(Uri authorizationUrl) async {
    var url = authorizationUrl.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw GithubLoginException('Could not launch $url');
    }
  }

  Future<Map<String, String>> _listen() async {
    final request = await _redirectServer!.first;
    final params = request.uri.queryParameters;
    request.response.statusCode = 200;
    request.response.headers.set('content-type', 'text/plain');
    request.response.writeln('Authenticated! You can close this tab.');
    await request.response.close();
    await _redirectServer!.close();
    _redirectServer = null;
    return params;
  }

  Future<void> logout() async {
    _authClient?.close();
    _authClient = null;
    await credentialsRepository.deleteAuthCredentials();
    notifyListeners();
  }

  @override
  void dispose() {
    _redirectServer?.close();
    _authClient?.close();
    super.dispose();
  }
}
