// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:github_demo/src/services/github/queries/github_queries.ast.gql.dart'
    as _i2;
import 'package:github_demo/src/services/github/queries/github_queries.var.gql.dart'
    as _i3;
import 'package:github_demo/src/services/github/queries/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'github_queries.req.gql.g.dart';

abstract class GViewerDetail
    implements Built<GViewerDetail, GViewerDetailBuilder> {
  GViewerDetail._();

  factory GViewerDetail([Function(GViewerDetailBuilder b) updates]) =
      _$GViewerDetail;

  static void _initializeBuilder(GViewerDetailBuilder b) => b
    ..operation =
        _i1.Operation(document: _i2.document, operationName: 'ViewerDetail');
  _i3.GViewerDetailVars get vars;
  _i1.Operation get operation;
  static Serializer<GViewerDetail> get serializer => _$gViewerDetailSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GViewerDetail.serializer, this)
          as Map<String, dynamic>);
  static GViewerDetail? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GViewerDetail.serializer, json);
}

abstract class GIssues implements Built<GIssues, GIssuesBuilder> {
  GIssues._();

  factory GIssues([Function(GIssuesBuilder b) updates]) = _$GIssues;

  static void _initializeBuilder(GIssuesBuilder b) => b
    ..operation =
        _i1.Operation(document: _i2.document, operationName: 'Issues');
  _i3.GIssuesVars get vars;
  _i1.Operation get operation;
  static Serializer<GIssues> get serializer => _$gIssuesSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GIssues.serializer, this)
          as Map<String, dynamic>);
  static GIssues? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GIssues.serializer, json);
}

abstract class GIssueDetails
    implements Built<GIssueDetails, GIssueDetailsBuilder> {
  GIssueDetails._();

  factory GIssueDetails([Function(GIssueDetailsBuilder b) updates]) =
      _$GIssueDetails;

  static void _initializeBuilder(GIssueDetailsBuilder b) => b
    ..operation =
        _i1.Operation(document: _i2.document, operationName: 'IssueDetails');
  _i3.GIssueDetailsVars get vars;
  _i1.Operation get operation;
  static Serializer<GIssueDetails> get serializer => _$gIssueDetailsSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GIssueDetails.serializer, this)
          as Map<String, dynamic>);
  static GIssueDetails? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GIssueDetails.serializer, json);
}

abstract class GAssignedIssues
    implements Built<GAssignedIssues, GAssignedIssuesBuilder> {
  GAssignedIssues._();

  factory GAssignedIssues([Function(GAssignedIssuesBuilder b) updates]) =
      _$GAssignedIssues;

  static void _initializeBuilder(GAssignedIssuesBuilder b) => b
    ..operation =
        _i1.Operation(document: _i2.document, operationName: 'AssignedIssues');
  _i3.GAssignedIssuesVars get vars;
  _i1.Operation get operation;
  static Serializer<GAssignedIssues> get serializer =>
      _$gAssignedIssuesSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GAssignedIssues.serializer, this)
          as Map<String, dynamic>);
  static GAssignedIssues? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GAssignedIssues.serializer, json);
}

abstract class GRepositories
    implements Built<GRepositories, GRepositoriesBuilder> {
  GRepositories._();

  factory GRepositories([Function(GRepositoriesBuilder b) updates]) =
      _$GRepositories;

  static void _initializeBuilder(GRepositoriesBuilder b) => b
    ..operation =
        _i1.Operation(document: _i2.document, operationName: 'Repositories');
  _i3.GRepositoriesVars get vars;
  _i1.Operation get operation;
  static Serializer<GRepositories> get serializer => _$gRepositoriesSerializer;
  Map<String, dynamic> toJson() =>
      (_i4.serializers.serializeWith(GRepositories.serializer, this)
          as Map<String, dynamic>);
  static GRepositories? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(GRepositories.serializer, json);
}
