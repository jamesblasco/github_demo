
import 'package:flutter/material.dart';
import 'package:github_demo/src/services/github/github_repository.dart';
import 'package:github_demo/src/services/github/queries/queries.dart';

 class UserProvider extends ChangeNotifier {
  final GithubRepository repository;

  UserProvider({required this.repository});

  GViewerDetailData? data;

  Future<void> fetch() async {
    data = await repository.fetchCurrentUser();
    notifyListeners();
  }
}
