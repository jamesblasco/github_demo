import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GitHubSignInPage extends StatefulWidget {
  final String url;
  final String redirectUrl;
  final bool clearCache;
  final String title;
  final String? userAgent;

  const GitHubSignInPage(
      {Key? key,
      required this.url,
      required this.redirectUrl,
      this.userAgent,
      this.clearCache = true,
      this.title = ""})
      : super(key: key);

  @override
  State createState() => _GitHubSignInPageState();
}

class _GitHubSignInPageState extends State<GitHubSignInPage> {
  static const String _userAgentMacOSX =
      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36";
  WebViewController? _webViewController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton.icon(
            onPressed: () {
              _webViewController?.clearCache();
            },
            icon: const Icon(Icons.clear_all),
            label: const Text('Clear Cache'),
          ),
        ],
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: (webViewController) =>
            _webViewController = webViewController,
        userAgent: widget.userAgent ?? _userAgentMacOSX,
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith(widget.redirectUrl)) {
            Navigator.of(context).pop(request.url
                .replaceFirst("${widget.redirectUrl}?code=", "")
                .trim());
            return NavigationDecision.prevent;
          } else if (request.url.contains("error=")) {
            Navigator.of(context).pop(
              Exception(Uri.parse(request.url).queryParameters["error"]),
            );
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
