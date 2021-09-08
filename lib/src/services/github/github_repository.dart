
import 'queries/queries.dart';

class GithubRepository {
  final Link link;

  GithubRepository({required this.link});

  Future<GIssuesData> fetchIssues({
    String? sort,
    List<String>? filters,
  }) async {
    final issuesReq = GIssues((b) => b
      ..vars.count = 100
      ..vars.query = """
      repo:flutter/flutter 
      $sort
      ${(filters ?? []).fold('', (previousValue, element) => '$previousValue $element')}
    """);

    final result = await link
        .request(Request(
          operation: issuesReq.operation,
          variables: issuesReq.vars.toJson(),
        ))
        .first;
    final errors = result.errors;
    if (errors != null && errors.isNotEmpty) {
      throw QueryException(errors);
    }
    return GIssuesData.fromJson(result.data!)!;
  }

  Future<GIssueDetailsData> fetchIssue(int number) async {
    final issuesReq = GIssueDetails(
      (b) => b
        ..vars.number = number
        ..vars.owner = 'flutter'
        ..vars.name = 'flutter',
    );

    final result = await link
        .request(Request(
          operation: issuesReq.operation,
          variables: issuesReq.vars.toJson(),
        ))
        .first;
    final errors = result.errors;
    if (errors != null && errors.isNotEmpty) {
      throw QueryException(errors);
    }
    return GIssueDetailsData.fromJson(result.data!)!;
  }

  Future<GViewerDetailData> fetchCurrentUser() async {
    final issuesReq = GViewerDetail((b) => b);

    final result = await link
        .request(Request(
          operation: issuesReq.operation,
          variables: issuesReq.vars.toJson(),
        ))
        .first;
    final errors = result.errors;
    if (errors != null && errors.isNotEmpty) {
      throw QueryException(errors);
    }
    return GViewerDetailData.fromJson(result.data!)!;
  }
}

class QueryException implements Exception {
  QueryException(this.errors);
  List<GraphQLError> errors;
  @override
  String toString() {
    return 'Query Exception: ${errors.map((err) => '$err').join(',')}';
  }
}

class Sort {
  static const String interaction = 'sort:interactions';
  static const String interactionAsc = 'sort:interactions-asc';

  static const String reactions = 'sort:reactions';
  static const String reactionsAsc = 'sort:reactions-asc';
  static const String reactionsThumbsUp = 'sort::reactions-+1';
  static const String reactionsThumbsDown = 'sort::reactions--1';
  static const String reactionsSmile = 'sort::reactions-smile';
  static const String reactionsTada = 'sort::reactions-tada';
  static const String reactionsHeart = 'sort::reactions-heart';

  static const String updated = 'sort:updated';
  static const String updatedAsc = 'sort:updated-asc';

  static const String dated = 'sort:committer-date';
  static const String datedAsc = 'sort:committer-date-asc';

  static final textValues = [
    dated,
    datedAsc,
    interaction,
    updated,
    updatedAsc,
    reactions,
    reactionsAsc,
  ];

  static final emojiValues = [
    reactionsThumbsUp,
    reactionsThumbsDown,
    reactionsSmile,
    reactionsTada,
    reactionsHeart
  ];
  static String toLocalString(String value) {
    switch (value) {
      case Sort.interaction:
        return 'Most commented';
      case Sort.interactionAsc:
        return 'Least commented';
      case Sort.reactions:
        return 'Highest number of reactions';
      case Sort.reactionsAsc:
        return 'Lowest number of reactions';
      case Sort.reactionsThumbsUp:
        return '👍';
      case Sort.reactionsThumbsDown:
        return '👎';
      case Sort.reactionsSmile:
        return '😄';
      case Sort.reactionsTada:
        return '🎉';
      case Sort.reactionsHeart:
        return '❤️';
      case Sort.updated:
        return 'Recently updated';
      case Sort.updatedAsc:
        return 'Least recently updated';
      case Sort.dated:
        return 'Newest';
      case Sort.datedAsc:
        return 'Oldest';
    }
    return '';
  }
}
