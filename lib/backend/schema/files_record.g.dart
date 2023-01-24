// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FilesRecord> _$filesRecordSerializer = new _$FilesRecordSerializer();

class _$FilesRecordSerializer implements StructuredSerializer<FilesRecord> {
  @override
  final Iterable<Type> types = const [FilesRecord, _$FilesRecord];
  @override
  final String wireName = 'FilesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FilesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.projectName;
    if (value != null) {
      result
        ..add('project_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastEdited;
    if (value != null) {
      result
        ..add('last_edited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.timeCreated;
    if (value != null) {
      result
        ..add('time_created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  FilesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FilesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'project_name':
          result.projectName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_edited':
          result.lastEdited = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'time_created':
          result.timeCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$FilesRecord extends FilesRecord {
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? projectName;
  @override
  final String? description;
  @override
  final DateTime? lastEdited;
  @override
  final DateTime? timeCreated;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FilesRecord([void Function(FilesRecordBuilder)? updates]) =>
      (new FilesRecordBuilder()..update(updates))._build();

  _$FilesRecord._(
      {this.owner,
      this.projectName,
      this.description,
      this.lastEdited,
      this.timeCreated,
      this.ffRef})
      : super._();

  @override
  FilesRecord rebuild(void Function(FilesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FilesRecordBuilder toBuilder() => new FilesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FilesRecord &&
        owner == other.owner &&
        projectName == other.projectName &&
        description == other.description &&
        lastEdited == other.lastEdited &&
        timeCreated == other.timeCreated &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, owner.hashCode), projectName.hashCode),
                    description.hashCode),
                lastEdited.hashCode),
            timeCreated.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FilesRecord')
          ..add('owner', owner)
          ..add('projectName', projectName)
          ..add('description', description)
          ..add('lastEdited', lastEdited)
          ..add('timeCreated', timeCreated)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FilesRecordBuilder implements Builder<FilesRecord, FilesRecordBuilder> {
  _$FilesRecord? _$v;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _projectName;
  String? get projectName => _$this._projectName;
  set projectName(String? projectName) => _$this._projectName = projectName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DateTime? _lastEdited;
  DateTime? get lastEdited => _$this._lastEdited;
  set lastEdited(DateTime? lastEdited) => _$this._lastEdited = lastEdited;

  DateTime? _timeCreated;
  DateTime? get timeCreated => _$this._timeCreated;
  set timeCreated(DateTime? timeCreated) => _$this._timeCreated = timeCreated;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FilesRecordBuilder() {
    FilesRecord._initializeBuilder(this);
  }

  FilesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _projectName = $v.projectName;
      _description = $v.description;
      _lastEdited = $v.lastEdited;
      _timeCreated = $v.timeCreated;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FilesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FilesRecord;
  }

  @override
  void update(void Function(FilesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FilesRecord build() => _build();

  _$FilesRecord _build() {
    final _$result = _$v ??
        new _$FilesRecord._(
            owner: owner,
            projectName: projectName,
            description: description,
            lastEdited: lastEdited,
            timeCreated: timeCreated,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
