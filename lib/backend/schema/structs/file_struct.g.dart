// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FileStruct> _$fileStructSerializer = new _$FileStructSerializer();

class _$FileStructSerializer implements StructuredSerializer<FileStruct> {
  @override
  final Iterable<Type> types = const [FileStruct, _$FileStruct];
  @override
  final String wireName = 'FileStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, FileStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.fileName;
    if (value != null) {
      result
        ..add('file_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fileUrl;
    if (value != null) {
      result
        ..add('file_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  FileStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FileStructBuilder();

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
        case 'file_name':
          result.fileName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'file_url':
          result.fileUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$FileStruct extends FileStruct {
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? fileName;
  @override
  final String? fileUrl;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$FileStruct([void Function(FileStructBuilder)? updates]) =>
      (new FileStructBuilder()..update(updates))._build();

  _$FileStruct._(
      {this.owner,
      this.fileName,
      this.fileUrl,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'FileStruct', 'firestoreUtilData');
  }

  @override
  FileStruct rebuild(void Function(FileStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FileStructBuilder toBuilder() => new FileStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FileStruct &&
        owner == other.owner &&
        fileName == other.fileName &&
        fileUrl == other.fileUrl &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, owner.hashCode), fileName.hashCode), fileUrl.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FileStruct')
          ..add('owner', owner)
          ..add('fileName', fileName)
          ..add('fileUrl', fileUrl)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class FileStructBuilder implements Builder<FileStruct, FileStructBuilder> {
  _$FileStruct? _$v;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _fileName;
  String? get fileName => _$this._fileName;
  set fileName(String? fileName) => _$this._fileName = fileName;

  String? _fileUrl;
  String? get fileUrl => _$this._fileUrl;
  set fileUrl(String? fileUrl) => _$this._fileUrl = fileUrl;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  FileStructBuilder() {
    FileStruct._initializeBuilder(this);
  }

  FileStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _owner = $v.owner;
      _fileName = $v.fileName;
      _fileUrl = $v.fileUrl;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FileStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FileStruct;
  }

  @override
  void update(void Function(FileStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FileStruct build() => _build();

  _$FileStruct _build() {
    final _$result = _$v ??
        new _$FileStruct._(
            owner: owner,
            fileName: fileName,
            fileUrl: fileUrl,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'FileStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
