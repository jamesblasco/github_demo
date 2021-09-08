import 'package:flutter/foundation.dart';
import 'package:github_demo/src/services/github/github_repository.dart';
import 'package:github_demo/src/services/github/queries/queries.dart';

class IssuesProvider extends ChangeNotifier {
  final GithubRepository repository;

  IssuesProvider({required this.repository});

  List<GIssueData>? get list =>
      data?.search.edges?.map((e) => e.node!).whereType<GIssueData>().toList();

  GIssuesData? _data;
  GIssuesData? get data => _data;

  String? _sorting;
  String get sorting => _sorting ?? Sort.updated;

  List<String> _filters = [];
  List<String> get filters => _filters;

  Future<void> fetch() async {
    _data = await repository.fetchIssues(sort: _sorting, filters: filters);
    notifyListeners();
  }

  Future<void> updateOrdering(String sorting) async {
    if (_sorting == sorting) return;
    _sorting = sorting;

    _data = null;
    notifyListeners();
    fetch();
  }

  Future<void> updateFilters(List<String> filters) async {
    _filters = List.from(filters);
    _data = null;
    notifyListeners();
    fetch();
  }

  Future<void> removeFilter(String filter) async {
    if (!_filters.contains(filter)) return;
    _filters.remove(filter);
    _data = null;
    notifyListeners();
    fetch();
  }

  Future<void> addFilter(String filter) async {
    if (_filters.contains(filter)) return;
    _filters.add(filter);
    _data = null;
    notifyListeners();
    fetch();
  }
}
