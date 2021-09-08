// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_queries.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GViewerDetailVars> _$gViewerDetailVarsSerializer =
    new _$GViewerDetailVarsSerializer();
Serializer<GIssuesVars> _$gIssuesVarsSerializer = new _$GIssuesVarsSerializer();
Serializer<GIssueDetailsVars> _$gIssueDetailsVarsSerializer =
    new _$GIssueDetailsVarsSerializer();
Serializer<GAssignedIssuesVars> _$gAssignedIssuesVarsSerializer =
    new _$GAssignedIssuesVarsSerializer();
Serializer<GRepositoriesVars> _$gRepositoriesVarsSerializer =
    new _$GRepositoriesVarsSerializer();

class _$GViewerDetailVarsSerializer
    implements StructuredSerializer<GViewerDetailVars> {
  @override
  final Iterable<Type> types = const [GViewerDetailVars, _$GViewerDetailVars];
  @override
  final String wireName = 'GViewerDetailVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GViewerDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GViewerDetailVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GViewerDetailVarsBuilder().build();
  }
}

class _$GIssuesVarsSerializer implements StructuredSerializer<GIssuesVars> {
  @override
  final Iterable<Type> types = const [GIssuesVars, _$GIssuesVars];
  @override
  final String wireName = 'GIssuesVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GIssuesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'query',
      serializers.serialize(object.query,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GIssuesVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GIssuesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'query':
          result.query = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GIssueDetailsVarsSerializer
    implements StructuredSerializer<GIssueDetailsVars> {
  @override
  final Iterable<Type> types = const [GIssueDetailsVars, _$GIssueDetailsVars];
  @override
  final String wireName = 'GIssueDetailsVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GIssueDetailsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'owner',
      serializers.serialize(object.owner,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'number',
      serializers.serialize(object.number, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GIssueDetailsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GIssueDetailsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number':
          result.number = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GAssignedIssuesVarsSerializer
    implements StructuredSerializer<GAssignedIssuesVars> {
  @override
  final Iterable<Type> types = const [
    GAssignedIssuesVars,
    _$GAssignedIssuesVars
  ];
  @override
  final String wireName = 'GAssignedIssuesVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAssignedIssuesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'query',
      serializers.serialize(object.query,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GAssignedIssuesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAssignedIssuesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'query':
          result.query = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GRepositoriesVarsSerializer
    implements StructuredSerializer<GRepositoriesVars> {
  @override
  final Iterable<Type> types = const [GRepositoriesVars, _$GRepositoriesVars];
  @override
  final String wireName = 'GRepositoriesVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRepositoriesVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GRepositoriesVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRepositoriesVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GViewerDetailVars extends GViewerDetailVars {
  factory _$GViewerDetailVars(
          [void Function(GViewerDetailVarsBuilder)? updates]) =>
      (new GViewerDetailVarsBuilder()..update(updates)).build();

  _$GViewerDetailVars._() : super._();

  @override
  GViewerDetailVars rebuild(void Function(GViewerDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GViewerDetailVarsBuilder toBuilder() =>
      new GViewerDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GViewerDetailVars;
  }

  @override
  int get hashCode {
    return 947680460;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GViewerDetailVars').toString();
  }
}

class GViewerDetailVarsBuilder
    implements Builder<GViewerDetailVars, GViewerDetailVarsBuilder> {
  _$GViewerDetailVars? _$v;

  GViewerDetailVarsBuilder();

  @override
  void replace(GViewerDetailVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GViewerDetailVars;
  }

  @override
  void update(void Function(GViewerDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GViewerDetailVars build() {
    final _$result = _$v ?? new _$GViewerDetailVars._();
    replace(_$result);
    return _$result;
  }
}

class _$GIssuesVars extends GIssuesVars {
  @override
  final String query;
  @override
  final int count;

  factory _$GIssuesVars([void Function(GIssuesVarsBuilder)? updates]) =>
      (new GIssuesVarsBuilder()..update(updates)).build();

  _$GIssuesVars._({required this.query, required this.count}) : super._() {
    BuiltValueNullFieldError.checkNotNull(query, 'GIssuesVars', 'query');
    BuiltValueNullFieldError.checkNotNull(count, 'GIssuesVars', 'count');
  }

  @override
  GIssuesVars rebuild(void Function(GIssuesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GIssuesVarsBuilder toBuilder() => new GIssuesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GIssuesVars && query == other.query && count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, query.hashCode), count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GIssuesVars')
          ..add('query', query)
          ..add('count', count))
        .toString();
  }
}

class GIssuesVarsBuilder implements Builder<GIssuesVars, GIssuesVarsBuilder> {
  _$GIssuesVars? _$v;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GIssuesVarsBuilder();

  GIssuesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _query = $v.query;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GIssuesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GIssuesVars;
  }

  @override
  void update(void Function(GIssuesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GIssuesVars build() {
    final _$result = _$v ??
        new _$GIssuesVars._(
            query: BuiltValueNullFieldError.checkNotNull(
                query, 'GIssuesVars', 'query'),
            count: BuiltValueNullFieldError.checkNotNull(
                count, 'GIssuesVars', 'count'));
    replace(_$result);
    return _$result;
  }
}

class _$GIssueDetailsVars extends GIssueDetailsVars {
  @override
  final String owner;
  @override
  final String name;
  @override
  final int number;

  factory _$GIssueDetailsVars(
          [void Function(GIssueDetailsVarsBuilder)? updates]) =>
      (new GIssueDetailsVarsBuilder()..update(updates)).build();

  _$GIssueDetailsVars._(
      {required this.owner, required this.name, required this.number})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(owner, 'GIssueDetailsVars', 'owner');
    BuiltValueNullFieldError.checkNotNull(name, 'GIssueDetailsVars', 'name');
    BuiltValueNullFieldError.checkNotNull(
        number, 'GIssueDetailsVars', 'number');
  }

  @override
  GIssueDetailsVars rebuild(void Function(GIssueDetailsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GIssueDetailsVarsBuilder toBuilder() =>
      new GIssueDetailsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GIssueDetailsVars &&
        owner == other.owner &&
        name == other.name &&
        number == other.number;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, owner.hashCode), name.hashCode), number.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GIssueDetailsVars')
          ..add('owner', owner)
          ..add('name', name)
          ..add('number', number))
        .toString();
  }
}

class GIssueDetailsVarsBuilder
    implements Builder<GIssueDetailsVars, GIssueDetailsVarsBuilder> {
  _$GIssueDetailsVars? _$v;

  String? _owner;
  String? get owner => _$this._owner;
  set owner(String? owner) => _$this._owner = owner;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _number;
  int? get number => _$this._number;
  set number(int? number) => _$this._number = number;

  GIssueDetailsVarsBuilder();

  GIssueDetailsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _name = $v.name;
      _number = $v.number;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GIssueDetailsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GIssueDetailsVars;
  }

  @override
  void update(void Function(GIssueDetailsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GIssueDetailsVars build() {
    final _$result = _$v ??
        new _$GIssueDetailsVars._(
            owner: BuiltValueNullFieldError.checkNotNull(
                owner, 'GIssueDetailsVars', 'owner'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'GIssueDetailsVars', 'name'),
            number: BuiltValueNullFieldError.checkNotNull(
                number, 'GIssueDetailsVars', 'number'));
    replace(_$result);
    return _$result;
  }
}

class _$GAssignedIssuesVars extends GAssignedIssuesVars {
  @override
  final String query;
  @override
  final int count;

  factory _$GAssignedIssuesVars(
          [void Function(GAssignedIssuesVarsBuilder)? updates]) =>
      (new GAssignedIssuesVarsBuilder()..update(updates)).build();

  _$GAssignedIssuesVars._({required this.query, required this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        query, 'GAssignedIssuesVars', 'query');
    BuiltValueNullFieldError.checkNotNull(
        count, 'GAssignedIssuesVars', 'count');
  }

  @override
  GAssignedIssuesVars rebuild(
          void Function(GAssignedIssuesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAssignedIssuesVarsBuilder toBuilder() =>
      new GAssignedIssuesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAssignedIssuesVars &&
        query == other.query &&
        count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, query.hashCode), count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAssignedIssuesVars')
          ..add('query', query)
          ..add('count', count))
        .toString();
  }
}

class GAssignedIssuesVarsBuilder
    implements Builder<GAssignedIssuesVars, GAssignedIssuesVarsBuilder> {
  _$GAssignedIssuesVars? _$v;

  String? _query;
  String? get query => _$this._query;
  set query(String? query) => _$this._query = query;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GAssignedIssuesVarsBuilder();

  GAssignedIssuesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _query = $v.query;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAssignedIssuesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAssignedIssuesVars;
  }

  @override
  void update(void Function(GAssignedIssuesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAssignedIssuesVars build() {
    final _$result = _$v ??
        new _$GAssignedIssuesVars._(
            query: BuiltValueNullFieldError.checkNotNull(
                query, 'GAssignedIssuesVars', 'query'),
            count: BuiltValueNullFieldError.checkNotNull(
                count, 'GAssignedIssuesVars', 'count'));
    replace(_$result);
    return _$result;
  }
}

class _$GRepositoriesVars extends GRepositoriesVars {
  @override
  final int count;

  factory _$GRepositoriesVars(
          [void Function(GRepositoriesVarsBuilder)? updates]) =>
      (new GRepositoriesVarsBuilder()..update(updates)).build();

  _$GRepositoriesVars._({required this.count}) : super._() {
    BuiltValueNullFieldError.checkNotNull(count, 'GRepositoriesVars', 'count');
  }

  @override
  GRepositoriesVars rebuild(void Function(GRepositoriesVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRepositoriesVarsBuilder toBuilder() =>
      new GRepositoriesVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRepositoriesVars && count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc(0, count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GRepositoriesVars')
          ..add('count', count))
        .toString();
  }
}

class GRepositoriesVarsBuilder
    implements Builder<GRepositoriesVars, GRepositoriesVarsBuilder> {
  _$GRepositoriesVars? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GRepositoriesVarsBuilder();

  GRepositoriesVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRepositoriesVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRepositoriesVars;
  }

  @override
  void update(void Function(GRepositoriesVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GRepositoriesVars build() {
    final _$result = _$v ??
        new _$GRepositoriesVars._(
            count: BuiltValueNullFieldError.checkNotNull(
                count, 'GRepositoriesVars', 'count'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
