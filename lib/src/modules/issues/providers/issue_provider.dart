import 'package:flutter/foundation.dart';
import 'package:github_demo/src/services/github/github_repository.dart';
import 'package:github_demo/src/services/github/queries/queries.dart';


class IssueProvider extends ChangeNotifier {
  final GithubRepository repository;

  IssueProvider({required this.repository, required this.data});

  final GIssueData data;
  GIssueDetailsData? _details;
  GIssueDetailsData? get details => _details;

  Future<void> fetch() async {
    _details = await repository.fetchIssue(data.number);
    notifyListeners();
  }
}
