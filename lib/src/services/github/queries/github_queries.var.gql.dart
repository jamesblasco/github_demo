// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:github_demo/src/services/github/queries/serializers.gql.dart'
    as _i1;

part 'github_queries.var.gql.g.dart';

abstract class GViewerDetailVars
    implements Built<GViewerDetailVars, GViewerDetailVarsBuilder> {
  GViewerDetailVars._();

  factory GViewerDetailVars([Function(GViewerDetailVarsBuilder b) updates]) =
      _$GViewerDetailVars;

  static Serializer<GViewerDetailVars> get serializer =>
      _$gViewerDetailVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GViewerDetailVars.serializer, this)
          as Map<String, dynamic>);
  static GViewerDetailVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GViewerDetailVars.serializer, json);
}

abstract class GIssuesVars implements Built<GIssuesVars, GIssuesVarsBuilder> {
  GIssuesVars._();

  factory GIssuesVars([Function(GIssuesVarsBuilder b) updates]) = _$GIssuesVars;

  String get query;
  int get count;
  static Serializer<GIssuesVars> get serializer => _$gIssuesVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GIssuesVars.serializer, this)
          as Map<String, dynamic>);
  static GIssuesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GIssuesVars.serializer, json);
}

abstract class GIssueDetailsVars
    implements Built<GIssueDetailsVars, GIssueDetailsVarsBuilder> {
  GIssueDetailsVars._();

  factory GIssueDetailsVars([Function(GIssueDetailsVarsBuilder b) updates]) =
      _$GIssueDetailsVars;

  String get owner;
  String get name;
  int get number;
  static Serializer<GIssueDetailsVars> get serializer =>
      _$gIssueDetailsVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GIssueDetailsVars.serializer, this)
          as Map<String, dynamic>);
  static GIssueDetailsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GIssueDetailsVars.serializer, json);
}

abstract class GAssignedIssuesVars
    implements Built<GAssignedIssuesVars, GAssignedIssuesVarsBuilder> {
  GAssignedIssuesVars._();

  factory GAssignedIssuesVars(
      [Function(GAssignedIssuesVarsBuilder b) updates]) = _$GAssignedIssuesVars;

  String get query;
  int get count;
  static Serializer<GAssignedIssuesVars> get serializer =>
      _$gAssignedIssuesVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GAssignedIssuesVars.serializer, this)
          as Map<String, dynamic>);
  static GAssignedIssuesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GAssignedIssuesVars.serializer, json);
}

abstract class GRepositoriesVars
    implements Built<GRepositoriesVars, GRepositoriesVarsBuilder> {
  GRepositoriesVars._();

  factory GRepositoriesVars([Function(GRepositoriesVarsBuilder b) updates]) =
      _$GRepositoriesVars;

  int get count;
  static Serializer<GRepositoriesVars> get serializer =>
      _$gRepositoriesVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GRepositoriesVars.serializer, this)
          as Map<String, dynamic>);
  static GRepositoriesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GRepositoriesVars.serializer, json);
}
