// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:github_demo/src/services/github/queries/github_schema.schema.gql.dart'
    as _i2;
import 'package:github_demo/src/services/github/queries/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder/src/serializers/inline_fragment_serializer.dart'
    as _i3;

part 'github_queries.data.gql.g.dart';

abstract class GViewerDetailData
    implements Built<GViewerDetailData, GViewerDetailDataBuilder> {
  GViewerDetailData._();

  factory GViewerDetailData([Function(GViewerDetailDataBuilder b) updates]) =
      _$GViewerDetailData;

  static void _initializeBuilder(GViewerDetailDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GViewerDetailData_viewer get viewer;
  static Serializer<GViewerDetailData> get serializer =>
      _$gViewerDetailDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GViewerDetailData.serializer, this)
          as Map<String, dynamic>);
  static GViewerDetailData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GViewerDetailData.serializer, json);
}

abstract class GViewerDetailData_viewer
    implements
        Built<GViewerDetailData_viewer, GViewerDetailData_viewerBuilder> {
  GViewerDetailData_viewer._();

  factory GViewerDetailData_viewer(
          [Function(GViewerDetailData_viewerBuilder b) updates]) =
      _$GViewerDetailData_viewer;

  static void _initializeBuilder(GViewerDetailData_viewerBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  _i2.GURI get avatarUrl;
  String? get name;
  static Serializer<GViewerDetailData_viewer> get serializer =>
      _$gViewerDetailDataViewerSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GViewerDetailData_viewer.serializer, this)
          as Map<String, dynamic>);
  static GViewerDetailData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GViewerDetailData_viewer.serializer, json);
}

abstract class GIssuesData implements Built<GIssuesData, GIssuesDataBuilder> {
  GIssuesData._();

  factory GIssuesData([Function(GIssuesDataBuilder b) updates]) = _$GIssuesData;

  static void _initializeBuilder(GIssuesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GIssuesData_search get search;
  static Serializer<GIssuesData> get serializer => _$gIssuesDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GIssuesData.serializer, this)
          as Map<String, dynamic>);
  static GIssuesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GIssuesData.serializer, json);
}

abstract class GIssuesData_search
    implements Built<GIssuesData_search, GIssuesData_searchBuilder> {
  GIssuesData_search._();

  factory GIssuesData_search([Function(GIssuesData_searchBuilder b) updates]) =
      _$GIssuesData_search;

  static void _initializeBuilder(GIssuesData_searchBuilder b) =>
      b..G__typename = 'SearchResultItemConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GIssuesData_search_edges>? get edges;
  static Serializer<GIssuesData_search> get serializer =>
      _$gIssuesDataSearchSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GIssuesData_search.serializer, this)
          as Map<String, dynamic>);
  static GIssuesData_search? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GIssuesData_search.serializer, json);
}

abstract class GIssuesData_search_edges
    implements
        Built<GIssuesData_search_edges, GIssuesData_search_edgesBuilder> {
  GIssuesData_search_edges._();

  factory GIssuesData_search_edges(
          [Function(GIssuesData_search_edgesBuilder b) updates]) =
      _$GIssuesData_search_edges;

  static void _initializeBuilder(GIssuesData_search_edgesBuilder b) =>
      b..G__typename = 'SearchResultItemEdge';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GIssuesData_search_edges_node? get node;
  static Serializer<GIssuesData_search_edges> get serializer =>
      _$gIssuesDataSearchEdgesSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GIssuesData_search_edges.serializer, this)
          as Map<String, dynamic>);
  static GIssuesData_search_edges? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GIssuesData_search_edges.serializer, json);
}

abstract class GIssuesData_search_edges_node {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GIssuesData_search_edges_node> get serializer =>
      _i3.InlineFragmentSerializer<GIssuesData_search_edges_node>(
          'GIssuesData_search_edges_node',
          GIssuesData_search_edges_node__base,
          [GIssuesData_search_edges_node__asIssue]);
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GIssuesData_search_edges_node.serializer, this) as Map<String, dynamic>);
  static GIssuesData_search_edges_node? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GIssuesData_search_edges_node.serializer, json);
}

abstract class GIssuesData_search_edges_node__base
    implements
        Built<GIssuesData_search_edges_node__base,
            GIssuesData_search_edges_node__baseBuilder>,
        GIssuesData_search_edges_node {
  GIssuesData_search_edges_node__base._();

  factory GIssuesData_search_edges_node__base(
          [Function(GIssuesData_search_edges_node__baseBuilder b) updates]) =
      _$GIssuesData_search_edges_node__base;

  static void _initializeBuilder(
          GIssuesData_search_edges_node__baseBuilder b) =>
      b..G__typename = 'SearchResultItem';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GIssuesData_search_edges_node__base> get serializer =>
      _$gIssuesDataSearchEdgesNodeBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GIssuesData_search_edges_node__base.serializer, this)
      as Map<String, dynamic>);
  static GIssuesData_search_edges_node__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssuesData_search_edges_node__base.serializer, json);
}

abstract class GIssuesData_search_edges_node__asIssue
    implements
        Built<GIssuesData_search_edges_node__asIssue,
            GIssuesData_search_edges_node__asIssueBuilder>,
        GIssuesData_search_edges_node {
  GIssuesData_search_edges_node__asIssue._();

  factory GIssuesData_search_edges_node__asIssue(
          [Function(GIssuesData_search_edges_node__asIssueBuilder b) updates]) =
      _$GIssuesData_search_edges_node__asIssue;

  static void _initializeBuilder(
          GIssuesData_search_edges_node__asIssueBuilder b) =>
      b..G__typename = 'Issue';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  int get number;
  _i2.GDateTime? get publishedAt;
  _i2.GDateTime get updatedAt;
  String get title;
  _i2.GURI get url;
  GIssuesData_search_edges_node__asIssue_labels? get labels;
  GIssuesData_search_edges_node__asIssue_author? get author;
  GIssuesData_search_edges_node__asIssue_comments get comments;
  static Serializer<GIssuesData_search_edges_node__asIssue> get serializer =>
      _$gIssuesDataSearchEdgesNodeAsIssueSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssuesData_search_edges_node__asIssue.serializer, this)
      as Map<String, dynamic>);
  static GIssuesData_search_edges_node__asIssue? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssuesData_search_edges_node__asIssue.serializer, json);
}

abstract class GIssuesData_search_edges_node__asIssue_labels
    implements
        Built<GIssuesData_search_edges_node__asIssue_labels,
            GIssuesData_search_edges_node__asIssue_labelsBuilder> {
  GIssuesData_search_edges_node__asIssue_labels._();

  factory GIssuesData_search_edges_node__asIssue_labels(
      [Function(GIssuesData_search_edges_node__asIssue_labelsBuilder b)
          updates]) = _$GIssuesData_search_edges_node__asIssue_labels;

  static void _initializeBuilder(
          GIssuesData_search_edges_node__asIssue_labelsBuilder b) =>
      b..G__typename = 'LabelConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GIssuesData_search_edges_node__asIssue_labels_edges>? get edges;
  static Serializer<GIssuesData_search_edges_node__asIssue_labels>
      get serializer => _$gIssuesDataSearchEdgesNodeAsIssueLabelsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssuesData_search_edges_node__asIssue_labels.serializer, this)
      as Map<String, dynamic>);
  static GIssuesData_search_edges_node__asIssue_labels? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssuesData_search_edges_node__asIssue_labels.serializer, json);
}

abstract class GIssuesData_search_edges_node__asIssue_labels_edges
    implements
        Built<GIssuesData_search_edges_node__asIssue_labels_edges,
            GIssuesData_search_edges_node__asIssue_labels_edgesBuilder> {
  GIssuesData_search_edges_node__asIssue_labels_edges._();

  factory GIssuesData_search_edges_node__asIssue_labels_edges(
      [Function(GIssuesData_search_edges_node__asIssue_labels_edgesBuilder b)
          updates]) = _$GIssuesData_search_edges_node__asIssue_labels_edges;

  static void _initializeBuilder(
          GIssuesData_search_edges_node__asIssue_labels_edgesBuilder b) =>
      b..G__typename = 'LabelEdge';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GIssuesData_search_edges_node__asIssue_labels_edges_node? get node;
  static Serializer<GIssuesData_search_edges_node__asIssue_labels_edges>
      get serializer =>
          _$gIssuesDataSearchEdgesNodeAsIssueLabelsEdgesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssuesData_search_edges_node__asIssue_labels_edges.serializer, this)
      as Map<String, dynamic>);
  static GIssuesData_search_edges_node__asIssue_labels_edges? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssuesData_search_edges_node__asIssue_labels_edges.serializer, json);
}

abstract class GIssuesData_search_edges_node__asIssue_labels_edges_node
    implements
        Built<GIssuesData_search_edges_node__asIssue_labels_edges_node,
            GIssuesData_search_edges_node__asIssue_labels_edges_nodeBuilder> {
  GIssuesData_search_edges_node__asIssue_labels_edges_node._();

  factory GIssuesData_search_edges_node__asIssue_labels_edges_node(
      [Function(
              GIssuesData_search_edges_node__asIssue_labels_edges_nodeBuilder b)
          updates]) = _$GIssuesData_search_edges_node__asIssue_labels_edges_node;

  static void _initializeBuilder(
          GIssuesData_search_edges_node__asIssue_labels_edges_nodeBuilder b) =>
      b..G__typename = 'Label';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get color;
  static Serializer<GIssuesData_search_edges_node__asIssue_labels_edges_node>
      get serializer =>
          _$gIssuesDataSearchEdgesNodeAsIssueLabelsEdgesNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GIssuesData_search_edges_node__asIssue_labels_edges_node.serializer,
      this) as Map<String, dynamic>);
  static GIssuesData_search_edges_node__asIssue_labels_edges_node? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssuesData_search_edges_node__asIssue_labels_edges_node.serializer,
          json);
}

abstract class GIssuesData_search_edges_node__asIssue_author
    implements
        Built<GIssuesData_search_edges_node__asIssue_author,
            GIssuesData_search_edges_node__asIssue_authorBuilder> {
  GIssuesData_search_edges_node__asIssue_author._();

  factory GIssuesData_search_edges_node__asIssue_author(
      [Function(GIssuesData_search_edges_node__asIssue_authorBuilder b)
          updates]) = _$GIssuesData_search_edges_node__asIssue_author;

  static void _initializeBuilder(
          GIssuesData_search_edges_node__asIssue_authorBuilder b) =>
      b..G__typename = 'Actor';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  _i2.GURI get avatarUrl;
  _i2.GURI get url;
  static Serializer<GIssuesData_search_edges_node__asIssue_author>
      get serializer => _$gIssuesDataSearchEdgesNodeAsIssueAuthorSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssuesData_search_edges_node__asIssue_author.serializer, this)
      as Map<String, dynamic>);
  static GIssuesData_search_edges_node__asIssue_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssuesData_search_edges_node__asIssue_author.serializer, json);
}

abstract class GIssuesData_search_edges_node__asIssue_comments
    implements
        Built<GIssuesData_search_edges_node__asIssue_comments,
            GIssuesData_search_edges_node__asIssue_commentsBuilder> {
  GIssuesData_search_edges_node__asIssue_comments._();

  factory GIssuesData_search_edges_node__asIssue_comments(
      [Function(GIssuesData_search_edges_node__asIssue_commentsBuilder b)
          updates]) = _$GIssuesData_search_edges_node__asIssue_comments;

  static void _initializeBuilder(
          GIssuesData_search_edges_node__asIssue_commentsBuilder b) =>
      b..G__typename = 'IssueCommentConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalCount;
  static Serializer<GIssuesData_search_edges_node__asIssue_comments>
      get serializer => _$gIssuesDataSearchEdgesNodeAsIssueCommentsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssuesData_search_edges_node__asIssue_comments.serializer, this)
      as Map<String, dynamic>);
  static GIssuesData_search_edges_node__asIssue_comments? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssuesData_search_edges_node__asIssue_comments.serializer, json);
}

abstract class GIssueDetailsData
    implements Built<GIssueDetailsData, GIssueDetailsDataBuilder> {
  GIssueDetailsData._();

  factory GIssueDetailsData([Function(GIssueDetailsDataBuilder b) updates]) =
      _$GIssueDetailsData;

  static void _initializeBuilder(GIssueDetailsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GIssueDetailsData_repository? get repository;
  static Serializer<GIssueDetailsData> get serializer =>
      _$gIssueDetailsDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GIssueDetailsData.serializer, this)
          as Map<String, dynamic>);
  static GIssueDetailsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GIssueDetailsData.serializer, json);
}

abstract class GIssueDetailsData_repository
    implements
        Built<GIssueDetailsData_repository,
            GIssueDetailsData_repositoryBuilder> {
  GIssueDetailsData_repository._();

  factory GIssueDetailsData_repository(
          [Function(GIssueDetailsData_repositoryBuilder b) updates]) =
      _$GIssueDetailsData_repository;

  static void _initializeBuilder(GIssueDetailsData_repositoryBuilder b) =>
      b..G__typename = 'Repository';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GIssueDetailsData_repository_issue? get issue;
  static Serializer<GIssueDetailsData_repository> get serializer =>
      _$gIssueDetailsDataRepositorySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GIssueDetailsData_repository.serializer, this) as Map<String, dynamic>);
  static GIssueDetailsData_repository? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GIssueDetailsData_repository.serializer, json);
}

abstract class GIssueDetailsData_repository_issue
    implements
        Built<GIssueDetailsData_repository_issue,
            GIssueDetailsData_repository_issueBuilder> {
  GIssueDetailsData_repository_issue._();

  factory GIssueDetailsData_repository_issue(
          [Function(GIssueDetailsData_repository_issueBuilder b) updates]) =
      _$GIssueDetailsData_repository_issue;

  static void _initializeBuilder(GIssueDetailsData_repository_issueBuilder b) =>
      b..G__typename = 'Issue';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  int get number;
  _i2.GDateTime? get publishedAt;
  _i2.GDateTime get updatedAt;
  String get title;
  _i2.GURI get url;
  String get bodyText;
  GIssueDetailsData_repository_issue_labels? get labels;
  GIssueDetailsData_repository_issue_author? get author;
  GIssueDetailsData_repository_issue_comments get comments;
  static Serializer<GIssueDetailsData_repository_issue> get serializer =>
      _$gIssueDetailsDataRepositoryIssueSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GIssueDetailsData_repository_issue.serializer, this)
      as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GIssueDetailsData_repository_issue.serializer, json);
}

abstract class GIssueDetailsData_repository_issue_labels
    implements
        Built<GIssueDetailsData_repository_issue_labels,
            GIssueDetailsData_repository_issue_labelsBuilder> {
  GIssueDetailsData_repository_issue_labels._();

  factory GIssueDetailsData_repository_issue_labels(
      [Function(GIssueDetailsData_repository_issue_labelsBuilder b)
          updates]) = _$GIssueDetailsData_repository_issue_labels;

  static void _initializeBuilder(
          GIssueDetailsData_repository_issue_labelsBuilder b) =>
      b..G__typename = 'LabelConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GIssueDetailsData_repository_issue_labels_edges>? get edges;
  static Serializer<GIssueDetailsData_repository_issue_labels> get serializer =>
      _$gIssueDetailsDataRepositoryIssueLabelsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssueDetailsData_repository_issue_labels.serializer, this)
      as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue_labels? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssueDetailsData_repository_issue_labels.serializer, json);
}

abstract class GIssueDetailsData_repository_issue_labels_edges
    implements
        Built<GIssueDetailsData_repository_issue_labels_edges,
            GIssueDetailsData_repository_issue_labels_edgesBuilder> {
  GIssueDetailsData_repository_issue_labels_edges._();

  factory GIssueDetailsData_repository_issue_labels_edges(
      [Function(GIssueDetailsData_repository_issue_labels_edgesBuilder b)
          updates]) = _$GIssueDetailsData_repository_issue_labels_edges;

  static void _initializeBuilder(
          GIssueDetailsData_repository_issue_labels_edgesBuilder b) =>
      b..G__typename = 'LabelEdge';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GIssueDetailsData_repository_issue_labels_edges_node? get node;
  static Serializer<GIssueDetailsData_repository_issue_labels_edges>
      get serializer => _$gIssueDetailsDataRepositoryIssueLabelsEdgesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssueDetailsData_repository_issue_labels_edges.serializer, this)
      as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue_labels_edges? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssueDetailsData_repository_issue_labels_edges.serializer, json);
}

abstract class GIssueDetailsData_repository_issue_labels_edges_node
    implements
        Built<GIssueDetailsData_repository_issue_labels_edges_node,
            GIssueDetailsData_repository_issue_labels_edges_nodeBuilder> {
  GIssueDetailsData_repository_issue_labels_edges_node._();

  factory GIssueDetailsData_repository_issue_labels_edges_node(
      [Function(GIssueDetailsData_repository_issue_labels_edges_nodeBuilder b)
          updates]) = _$GIssueDetailsData_repository_issue_labels_edges_node;

  static void _initializeBuilder(
          GIssueDetailsData_repository_issue_labels_edges_nodeBuilder b) =>
      b..G__typename = 'Label';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get color;
  static Serializer<GIssueDetailsData_repository_issue_labels_edges_node>
      get serializer =>
          _$gIssueDetailsDataRepositoryIssueLabelsEdgesNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssueDetailsData_repository_issue_labels_edges_node.serializer, this)
      as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue_labels_edges_node? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssueDetailsData_repository_issue_labels_edges_node.serializer,
          json);
}

abstract class GIssueDetailsData_repository_issue_author
    implements
        Built<GIssueDetailsData_repository_issue_author,
            GIssueDetailsData_repository_issue_authorBuilder> {
  GIssueDetailsData_repository_issue_author._();

  factory GIssueDetailsData_repository_issue_author(
      [Function(GIssueDetailsData_repository_issue_authorBuilder b)
          updates]) = _$GIssueDetailsData_repository_issue_author;

  static void _initializeBuilder(
          GIssueDetailsData_repository_issue_authorBuilder b) =>
      b..G__typename = 'Actor';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  _i2.GURI get avatarUrl;
  _i2.GURI get url;
  static Serializer<GIssueDetailsData_repository_issue_author> get serializer =>
      _$gIssueDetailsDataRepositoryIssueAuthorSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssueDetailsData_repository_issue_author.serializer, this)
      as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssueDetailsData_repository_issue_author.serializer, json);
}

abstract class GIssueDetailsData_repository_issue_comments
    implements
        Built<GIssueDetailsData_repository_issue_comments,
            GIssueDetailsData_repository_issue_commentsBuilder> {
  GIssueDetailsData_repository_issue_comments._();

  factory GIssueDetailsData_repository_issue_comments(
      [Function(GIssueDetailsData_repository_issue_commentsBuilder b)
          updates]) = _$GIssueDetailsData_repository_issue_comments;

  static void _initializeBuilder(
          GIssueDetailsData_repository_issue_commentsBuilder b) =>
      b..G__typename = 'IssueCommentConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalCount;
  BuiltList<GIssueDetailsData_repository_issue_comments_edges>? get edges;
  static Serializer<GIssueDetailsData_repository_issue_comments>
      get serializer => _$gIssueDetailsDataRepositoryIssueCommentsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssueDetailsData_repository_issue_comments.serializer, this)
      as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue_comments? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssueDetailsData_repository_issue_comments.serializer, json);
}

abstract class GIssueDetailsData_repository_issue_comments_edges
    implements
        Built<GIssueDetailsData_repository_issue_comments_edges,
            GIssueDetailsData_repository_issue_comments_edgesBuilder> {
  GIssueDetailsData_repository_issue_comments_edges._();

  factory GIssueDetailsData_repository_issue_comments_edges(
      [Function(GIssueDetailsData_repository_issue_comments_edgesBuilder b)
          updates]) = _$GIssueDetailsData_repository_issue_comments_edges;

  static void _initializeBuilder(
          GIssueDetailsData_repository_issue_comments_edgesBuilder b) =>
      b..G__typename = 'IssueCommentEdge';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GIssueDetailsData_repository_issue_comments_edges_node? get node;
  static Serializer<GIssueDetailsData_repository_issue_comments_edges>
      get serializer =>
          _$gIssueDetailsDataRepositoryIssueCommentsEdgesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GIssueDetailsData_repository_issue_comments_edges.serializer, this)
      as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue_comments_edges? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssueDetailsData_repository_issue_comments_edges.serializer, json);
}

abstract class GIssueDetailsData_repository_issue_comments_edges_node
    implements
        Built<GIssueDetailsData_repository_issue_comments_edges_node,
            GIssueDetailsData_repository_issue_comments_edges_nodeBuilder> {
  GIssueDetailsData_repository_issue_comments_edges_node._();

  factory GIssueDetailsData_repository_issue_comments_edges_node(
      [Function(GIssueDetailsData_repository_issue_comments_edges_nodeBuilder b)
          updates]) = _$GIssueDetailsData_repository_issue_comments_edges_node;

  static void _initializeBuilder(
          GIssueDetailsData_repository_issue_comments_edges_nodeBuilder b) =>
      b..G__typename = 'IssueComment';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get body;
  _i2.GDateTime get createdAt;
  _i2.GDateTime? get lastEditedAt;
  GIssueDetailsData_repository_issue_comments_edges_node_author? get author;
  static Serializer<GIssueDetailsData_repository_issue_comments_edges_node>
      get serializer =>
          _$gIssueDetailsDataRepositoryIssueCommentsEdgesNodeSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GIssueDetailsData_repository_issue_comments_edges_node.serializer,
      this) as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue_comments_edges_node? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GIssueDetailsData_repository_issue_comments_edges_node.serializer,
          json);
}

abstract class GIssueDetailsData_repository_issue_comments_edges_node_author
    implements
        Built<GIssueDetailsData_repository_issue_comments_edges_node_author,
            GIssueDetailsData_repository_issue_comments_edges_node_authorBuilder> {
  GIssueDetailsData_repository_issue_comments_edges_node_author._();

  factory GIssueDetailsData_repository_issue_comments_edges_node_author(
          [Function(
                  GIssueDetailsData_repository_issue_comments_edges_node_authorBuilder
                      b)
              updates]) =
      _$GIssueDetailsData_repository_issue_comments_edges_node_author;

  static void _initializeBuilder(
          GIssueDetailsData_repository_issue_comments_edges_node_authorBuilder
              b) =>
      b..G__typename = 'Actor';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  _i2.GURI get avatarUrl;
  _i2.GURI get url;
  static Serializer<
          GIssueDetailsData_repository_issue_comments_edges_node_author>
      get serializer =>
          _$gIssueDetailsDataRepositoryIssueCommentsEdgesNodeAuthorSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GIssueDetailsData_repository_issue_comments_edges_node_author.serializer,
      this) as Map<String, dynamic>);
  static GIssueDetailsData_repository_issue_comments_edges_node_author?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
          GIssueDetailsData_repository_issue_comments_edges_node_author
              .serializer,
          json);
}

abstract class GAssignedIssuesData
    implements Built<GAssignedIssuesData, GAssignedIssuesDataBuilder> {
  GAssignedIssuesData._();

  factory GAssignedIssuesData(
      [Function(GAssignedIssuesDataBuilder b) updates]) = _$GAssignedIssuesData;

  static void _initializeBuilder(GAssignedIssuesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAssignedIssuesData_search get search;
  static Serializer<GAssignedIssuesData> get serializer =>
      _$gAssignedIssuesDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAssignedIssuesData.serializer, this)
          as Map<String, dynamic>);
  static GAssignedIssuesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAssignedIssuesData.serializer, json);
}

abstract class GAssignedIssuesData_search
    implements
        Built<GAssignedIssuesData_search, GAssignedIssuesData_searchBuilder> {
  GAssignedIssuesData_search._();

  factory GAssignedIssuesData_search(
          [Function(GAssignedIssuesData_searchBuilder b) updates]) =
      _$GAssignedIssuesData_search;

  static void _initializeBuilder(GAssignedIssuesData_searchBuilder b) =>
      b..G__typename = 'SearchResultItemConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAssignedIssuesData_search_edges>? get edges;
  static Serializer<GAssignedIssuesData_search> get serializer =>
      _$gAssignedIssuesDataSearchSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAssignedIssuesData_search.serializer, this) as Map<String, dynamic>);
  static GAssignedIssuesData_search? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAssignedIssuesData_search.serializer, json);
}

abstract class GAssignedIssuesData_search_edges
    implements
        Built<GAssignedIssuesData_search_edges,
            GAssignedIssuesData_search_edgesBuilder> {
  GAssignedIssuesData_search_edges._();

  factory GAssignedIssuesData_search_edges(
          [Function(GAssignedIssuesData_search_edgesBuilder b) updates]) =
      _$GAssignedIssuesData_search_edges;

  static void _initializeBuilder(GAssignedIssuesData_search_edgesBuilder b) =>
      b..G__typename = 'SearchResultItemEdge';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAssignedIssuesData_search_edges_node? get node;
  static Serializer<GAssignedIssuesData_search_edges> get serializer =>
      _$gAssignedIssuesDataSearchEdgesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAssignedIssuesData_search_edges.serializer, this)
      as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GAssignedIssuesData_search_edges.serializer, json);
}

abstract class GAssignedIssuesData_search_edges_node {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAssignedIssuesData_search_edges_node> get serializer =>
      _i3.InlineFragmentSerializer<GAssignedIssuesData_search_edges_node>(
          'GAssignedIssuesData_search_edges_node',
          GAssignedIssuesData_search_edges_node__base,
          [GAssignedIssuesData_search_edges_node__asIssue]);
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GAssignedIssuesData_search_edges_node.serializer, this)
      as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges_node? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAssignedIssuesData_search_edges_node.serializer, json);
}

abstract class GAssignedIssuesData_search_edges_node__base
    implements
        Built<GAssignedIssuesData_search_edges_node__base,
            GAssignedIssuesData_search_edges_node__baseBuilder>,
        GAssignedIssuesData_search_edges_node {
  GAssignedIssuesData_search_edges_node__base._();

  factory GAssignedIssuesData_search_edges_node__base(
      [Function(GAssignedIssuesData_search_edges_node__baseBuilder b)
          updates]) = _$GAssignedIssuesData_search_edges_node__base;

  static void _initializeBuilder(
          GAssignedIssuesData_search_edges_node__baseBuilder b) =>
      b..G__typename = 'SearchResultItem';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GAssignedIssuesData_search_edges_node__base>
      get serializer => _$gAssignedIssuesDataSearchEdgesNodeBaseSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAssignedIssuesData_search_edges_node__base.serializer, this)
      as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges_node__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAssignedIssuesData_search_edges_node__base.serializer, json);
}

abstract class GAssignedIssuesData_search_edges_node__asIssue
    implements
        Built<GAssignedIssuesData_search_edges_node__asIssue,
            GAssignedIssuesData_search_edges_node__asIssueBuilder>,
        GAssignedIssuesData_search_edges_node {
  GAssignedIssuesData_search_edges_node__asIssue._();

  factory GAssignedIssuesData_search_edges_node__asIssue(
      [Function(GAssignedIssuesData_search_edges_node__asIssueBuilder b)
          updates]) = _$GAssignedIssuesData_search_edges_node__asIssue;

  static void _initializeBuilder(
          GAssignedIssuesData_search_edges_node__asIssueBuilder b) =>
      b..G__typename = 'Issue';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GAssignedIssuesData_search_edges_node__asIssue_repository get repository;
  int get number;
  _i2.GURI get url;
  String get title;
  GAssignedIssuesData_search_edges_node__asIssue_author? get author;
  GAssignedIssuesData_search_edges_node__asIssue_labels? get labels;
  GAssignedIssuesData_search_edges_node__asIssue_comments get comments;
  static Serializer<GAssignedIssuesData_search_edges_node__asIssue>
      get serializer => _$gAssignedIssuesDataSearchEdgesNodeAsIssueSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GAssignedIssuesData_search_edges_node__asIssue.serializer, this)
      as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges_node__asIssue? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAssignedIssuesData_search_edges_node__asIssue.serializer, json);
}

abstract class GAssignedIssuesData_search_edges_node__asIssue_repository
    implements
        Built<GAssignedIssuesData_search_edges_node__asIssue_repository,
            GAssignedIssuesData_search_edges_node__asIssue_repositoryBuilder> {
  GAssignedIssuesData_search_edges_node__asIssue_repository._();

  factory GAssignedIssuesData_search_edges_node__asIssue_repository(
      [Function(
              GAssignedIssuesData_search_edges_node__asIssue_repositoryBuilder
                  b)
          updates]) = _$GAssignedIssuesData_search_edges_node__asIssue_repository;

  static void _initializeBuilder(
          GAssignedIssuesData_search_edges_node__asIssue_repositoryBuilder b) =>
      b..G__typename = 'Repository';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get nameWithOwner;
  _i2.GURI get url;
  static Serializer<GAssignedIssuesData_search_edges_node__asIssue_repository>
      get serializer =>
          _$gAssignedIssuesDataSearchEdgesNodeAsIssueRepositorySerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAssignedIssuesData_search_edges_node__asIssue_repository.serializer,
      this) as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges_node__asIssue_repository? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAssignedIssuesData_search_edges_node__asIssue_repository.serializer,
          json);
}

abstract class GAssignedIssuesData_search_edges_node__asIssue_author
    implements
        Built<GAssignedIssuesData_search_edges_node__asIssue_author,
            GAssignedIssuesData_search_edges_node__asIssue_authorBuilder> {
  GAssignedIssuesData_search_edges_node__asIssue_author._();

  factory GAssignedIssuesData_search_edges_node__asIssue_author(
      [Function(GAssignedIssuesData_search_edges_node__asIssue_authorBuilder b)
          updates]) = _$GAssignedIssuesData_search_edges_node__asIssue_author;

  static void _initializeBuilder(
          GAssignedIssuesData_search_edges_node__asIssue_authorBuilder b) =>
      b..G__typename = 'Actor';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  _i2.GURI get url;
  static Serializer<GAssignedIssuesData_search_edges_node__asIssue_author>
      get serializer =>
          _$gAssignedIssuesDataSearchEdgesNodeAsIssueAuthorSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAssignedIssuesData_search_edges_node__asIssue_author.serializer,
      this) as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges_node__asIssue_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAssignedIssuesData_search_edges_node__asIssue_author.serializer,
          json);
}

abstract class GAssignedIssuesData_search_edges_node__asIssue_labels
    implements
        Built<GAssignedIssuesData_search_edges_node__asIssue_labels,
            GAssignedIssuesData_search_edges_node__asIssue_labelsBuilder> {
  GAssignedIssuesData_search_edges_node__asIssue_labels._();

  factory GAssignedIssuesData_search_edges_node__asIssue_labels(
      [Function(GAssignedIssuesData_search_edges_node__asIssue_labelsBuilder b)
          updates]) = _$GAssignedIssuesData_search_edges_node__asIssue_labels;

  static void _initializeBuilder(
          GAssignedIssuesData_search_edges_node__asIssue_labelsBuilder b) =>
      b..G__typename = 'LabelConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GAssignedIssuesData_search_edges_node__asIssue_labels_nodes>?
      get nodes;
  static Serializer<GAssignedIssuesData_search_edges_node__asIssue_labels>
      get serializer =>
          _$gAssignedIssuesDataSearchEdgesNodeAsIssueLabelsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAssignedIssuesData_search_edges_node__asIssue_labels.serializer,
      this) as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges_node__asIssue_labels? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAssignedIssuesData_search_edges_node__asIssue_labels.serializer,
          json);
}

abstract class GAssignedIssuesData_search_edges_node__asIssue_labels_nodes
    implements
        Built<GAssignedIssuesData_search_edges_node__asIssue_labels_nodes,
            GAssignedIssuesData_search_edges_node__asIssue_labels_nodesBuilder> {
  GAssignedIssuesData_search_edges_node__asIssue_labels_nodes._();

  factory GAssignedIssuesData_search_edges_node__asIssue_labels_nodes(
      [Function(
              GAssignedIssuesData_search_edges_node__asIssue_labels_nodesBuilder
                  b)
          updates]) = _$GAssignedIssuesData_search_edges_node__asIssue_labels_nodes;

  static void _initializeBuilder(
          GAssignedIssuesData_search_edges_node__asIssue_labels_nodesBuilder
              b) =>
      b..G__typename = 'Label';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String get color;
  static Serializer<GAssignedIssuesData_search_edges_node__asIssue_labels_nodes>
      get serializer =>
          _$gAssignedIssuesDataSearchEdgesNodeAsIssueLabelsNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAssignedIssuesData_search_edges_node__asIssue_labels_nodes.serializer,
      this) as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges_node__asIssue_labels_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAssignedIssuesData_search_edges_node__asIssue_labels_nodes
              .serializer,
          json);
}

abstract class GAssignedIssuesData_search_edges_node__asIssue_comments
    implements
        Built<GAssignedIssuesData_search_edges_node__asIssue_comments,
            GAssignedIssuesData_search_edges_node__asIssue_commentsBuilder> {
  GAssignedIssuesData_search_edges_node__asIssue_comments._();

  factory GAssignedIssuesData_search_edges_node__asIssue_comments(
      [Function(
              GAssignedIssuesData_search_edges_node__asIssue_commentsBuilder b)
          updates]) = _$GAssignedIssuesData_search_edges_node__asIssue_comments;

  static void _initializeBuilder(
          GAssignedIssuesData_search_edges_node__asIssue_commentsBuilder b) =>
      b..G__typename = 'IssueCommentConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalCount;
  static Serializer<GAssignedIssuesData_search_edges_node__asIssue_comments>
      get serializer =>
          _$gAssignedIssuesDataSearchEdgesNodeAsIssueCommentsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GAssignedIssuesData_search_edges_node__asIssue_comments.serializer,
      this) as Map<String, dynamic>);
  static GAssignedIssuesData_search_edges_node__asIssue_comments? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GAssignedIssuesData_search_edges_node__asIssue_comments.serializer,
          json);
}

abstract class GRepositoriesData
    implements Built<GRepositoriesData, GRepositoriesDataBuilder> {
  GRepositoriesData._();

  factory GRepositoriesData([Function(GRepositoriesDataBuilder b) updates]) =
      _$GRepositoriesData;

  static void _initializeBuilder(GRepositoriesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GRepositoriesData_viewer get viewer;
  static Serializer<GRepositoriesData> get serializer =>
      _$gRepositoriesDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRepositoriesData.serializer, this)
          as Map<String, dynamic>);
  static GRepositoriesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRepositoriesData.serializer, json);
}

abstract class GRepositoriesData_viewer
    implements
        Built<GRepositoriesData_viewer, GRepositoriesData_viewerBuilder> {
  GRepositoriesData_viewer._();

  factory GRepositoriesData_viewer(
          [Function(GRepositoriesData_viewerBuilder b) updates]) =
      _$GRepositoriesData_viewer;

  static void _initializeBuilder(GRepositoriesData_viewerBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GRepositoriesData_viewer_repositories get repositories;
  static Serializer<GRepositoriesData_viewer> get serializer =>
      _$gRepositoriesDataViewerSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRepositoriesData_viewer.serializer, this)
          as Map<String, dynamic>);
  static GRepositoriesData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GRepositoriesData_viewer.serializer, json);
}

abstract class GRepositoriesData_viewer_repositories
    implements
        Built<GRepositoriesData_viewer_repositories,
            GRepositoriesData_viewer_repositoriesBuilder> {
  GRepositoriesData_viewer_repositories._();

  factory GRepositoriesData_viewer_repositories(
          [Function(GRepositoriesData_viewer_repositoriesBuilder b) updates]) =
      _$GRepositoriesData_viewer_repositories;

  static void _initializeBuilder(
          GRepositoriesData_viewer_repositoriesBuilder b) =>
      b..G__typename = 'RepositoryConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GRepositoriesData_viewer_repositories_nodes>? get nodes;
  static Serializer<GRepositoriesData_viewer_repositories> get serializer =>
      _$gRepositoriesDataViewerRepositoriesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers
          .serializeWith(GRepositoriesData_viewer_repositories.serializer, this)
      as Map<String, dynamic>);
  static GRepositoriesData_viewer_repositories? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRepositoriesData_viewer_repositories.serializer, json);
}

abstract class GRepositoriesData_viewer_repositories_nodes
    implements
        Built<GRepositoriesData_viewer_repositories_nodes,
            GRepositoriesData_viewer_repositories_nodesBuilder> {
  GRepositoriesData_viewer_repositories_nodes._();

  factory GRepositoriesData_viewer_repositories_nodes(
      [Function(GRepositoriesData_viewer_repositories_nodesBuilder b)
          updates]) = _$GRepositoriesData_viewer_repositories_nodes;

  static void _initializeBuilder(
          GRepositoriesData_viewer_repositories_nodesBuilder b) =>
      b..G__typename = 'Repository';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  String? get description;
  bool get isFork;
  bool get isPrivate;
  GRepositoriesData_viewer_repositories_nodes_stargazers get stargazers;
  _i2.GURI get url;
  GRepositoriesData_viewer_repositories_nodes_issues get issues;
  GRepositoriesData_viewer_repositories_nodes_owner get owner;
  static Serializer<GRepositoriesData_viewer_repositories_nodes>
      get serializer => _$gRepositoriesDataViewerRepositoriesNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GRepositoriesData_viewer_repositories_nodes.serializer, this)
      as Map<String, dynamic>);
  static GRepositoriesData_viewer_repositories_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRepositoriesData_viewer_repositories_nodes.serializer, json);
}

abstract class GRepositoriesData_viewer_repositories_nodes_stargazers
    implements
        Built<GRepositoriesData_viewer_repositories_nodes_stargazers,
            GRepositoriesData_viewer_repositories_nodes_stargazersBuilder> {
  GRepositoriesData_viewer_repositories_nodes_stargazers._();

  factory GRepositoriesData_viewer_repositories_nodes_stargazers(
      [Function(GRepositoriesData_viewer_repositories_nodes_stargazersBuilder b)
          updates]) = _$GRepositoriesData_viewer_repositories_nodes_stargazers;

  static void _initializeBuilder(
          GRepositoriesData_viewer_repositories_nodes_stargazersBuilder b) =>
      b..G__typename = 'StargazerConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalCount;
  static Serializer<GRepositoriesData_viewer_repositories_nodes_stargazers>
      get serializer =>
          _$gRepositoriesDataViewerRepositoriesNodesStargazersSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
      GRepositoriesData_viewer_repositories_nodes_stargazers.serializer,
      this) as Map<String, dynamic>);
  static GRepositoriesData_viewer_repositories_nodes_stargazers? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRepositoriesData_viewer_repositories_nodes_stargazers.serializer,
          json);
}

abstract class GRepositoriesData_viewer_repositories_nodes_issues
    implements
        Built<GRepositoriesData_viewer_repositories_nodes_issues,
            GRepositoriesData_viewer_repositories_nodes_issuesBuilder> {
  GRepositoriesData_viewer_repositories_nodes_issues._();

  factory GRepositoriesData_viewer_repositories_nodes_issues(
      [Function(GRepositoriesData_viewer_repositories_nodes_issuesBuilder b)
          updates]) = _$GRepositoriesData_viewer_repositories_nodes_issues;

  static void _initializeBuilder(
          GRepositoriesData_viewer_repositories_nodes_issuesBuilder b) =>
      b..G__typename = 'IssueConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get totalCount;
  static Serializer<GRepositoriesData_viewer_repositories_nodes_issues>
      get serializer =>
          _$gRepositoriesDataViewerRepositoriesNodesIssuesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GRepositoriesData_viewer_repositories_nodes_issues.serializer, this)
      as Map<String, dynamic>);
  static GRepositoriesData_viewer_repositories_nodes_issues? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRepositoriesData_viewer_repositories_nodes_issues.serializer, json);
}

abstract class GRepositoriesData_viewer_repositories_nodes_owner
    implements
        Built<GRepositoriesData_viewer_repositories_nodes_owner,
            GRepositoriesData_viewer_repositories_nodes_ownerBuilder> {
  GRepositoriesData_viewer_repositories_nodes_owner._();

  factory GRepositoriesData_viewer_repositories_nodes_owner(
      [Function(GRepositoriesData_viewer_repositories_nodes_ownerBuilder b)
          updates]) = _$GRepositoriesData_viewer_repositories_nodes_owner;

  static void _initializeBuilder(
          GRepositoriesData_viewer_repositories_nodes_ownerBuilder b) =>
      b..G__typename = 'RepositoryOwner';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get login;
  _i2.GURI get avatarUrl;
  static Serializer<GRepositoriesData_viewer_repositories_nodes_owner>
      get serializer =>
          _$gRepositoriesDataViewerRepositoriesNodesOwnerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
          GRepositoriesData_viewer_repositories_nodes_owner.serializer, this)
      as Map<String, dynamic>);
  static GRepositoriesData_viewer_repositories_nodes_owner? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GRepositoriesData_viewer_repositories_nodes_owner.serializer, json);
}
