import 'package:flutter/widgets.dart';
import 'package:github_demo/src/services/preferences/preferences_repository.dart';

class SeenIssuesProvider extends ChangeNotifier {
  final PreferencesRepository repository;

  SeenIssuesProvider({required this.repository}) {
    _load();
  }

  List<String>? _issues;

  Future<void> _load() async {
    _issues = await repository.readReadIssues();
    notifyListeners();
  }

  bool contains(String id) => _issues?.contains(id) ?? false;

  Future<void> readIssue(String id) async {
    if (_issues == null) return;
    _issues!.add(id);
    await repository.writeReadIssues(_issues!);
    notifyListeners();
  }
}
