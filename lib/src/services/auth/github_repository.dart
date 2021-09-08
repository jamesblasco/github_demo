import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;


final _authorizationEndpoint =
    Uri.parse('https://github.com/login/oauth/authorize');
final _tokenEndpoint = Uri.parse('https://github.com/login/oauth/access_token');

class GithubAuthRepository {
  final String githubClientId;
  final String githubClientSecret;

  final List<String> githubScopes;

  GithubAuthRepository({
    required this.githubClientId,
    required this.githubClientSecret,
    this.githubScopes = const [],
  }) : assert(
          githubClientId.isNotEmpty && githubClientSecret.isNotEmpty,
          const GithubLoginException(
              'githubClientId and githubClientSecret must be not empty. '
              'See `lib/github_oauth_credentials.dart` for more detail.'),
        );

  oauth2.AuthorizationCodeGrant getGrant() {
    return oauth2.AuthorizationCodeGrant(
      githubClientId,
      _authorizationEndpoint,
      _tokenEndpoint,
      secret: githubClientSecret,
      httpClient: _JsonAcceptingHttpClient(),
    );
  }

  Uri getAuthorizationUrl(
      oauth2.AuthorizationCodeGrant grant, Uri redirectUrl) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: githubScopes);
  }

  Future<http.Client> getClientForAuthResponse(
     oauth2.AuthorizationCodeGrant grant,
      Map<String, String> authResponse) async {
    return await grant.handleAuthorizationResponse(authResponse);
  }

  String? getCredentialsForClient(http.Client client) {
    if (client is oauth2.Client) {
      return client.credentials.toJson();
    }
  }

  Future<http.Client> getClientForCredentials(String json) async {
    final credentials = oauth2.Credentials.fromJson(json);
    return oauth2.Client(
      credentials,
      identifier: githubClientId,
      secret: githubClientSecret,
    );
  }
}

class _JsonAcceptingHttpClient extends http.BaseClient {
  final _httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return _httpClient.send(request);
  }
}

class GithubLoginException implements Exception {
  const GithubLoginException(this.message);
  final String message;
  @override
  String toString() => message;
}
