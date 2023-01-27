// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FileRecord> _$fileRecordSerializer = new _$FileRecordSerializer();

class _$FileRecordSerializer implements StructuredSerializer<FileRecord> {
  @override
  final Iterable<Type> types = const [FileRecord, _$FileRecord];
  @override
  final String wireName = 'FileRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FileRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.owner;
    if (value != null) {
      result
        ..add('owner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.tags;
    if (value != null) {
      result
        ..add('tags')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Color)));
    }
    value = object.created;
    if (value != null) {
      result
        ..add('created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.size;
    if (value != null) {
      result
        ..add('size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.fileUrl;
    if (value != null) {
      result
        ..add('file_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.fileExtension;
    if (value != null) {
      result
        ..add('file_extension')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  FileRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FileRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'owner':
          result.owner = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'tags':
          result.tags = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color?;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'size':
          result.size = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'file_url':
          result.fileUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'file_extension':
          result.fileExtension = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$FileRecord extends FileRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? owner;
  @override
  final String? tags;
  @override
  final Color? color;
  @override
  final DateTime? created;
  @override
  final double? size;
  @override
  final String? fileUrl;
  @override
  final String? fileExtension;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FileRecord([void Function(FileRecordBuilder)? updates]) =>
      (new FileRecordBuilder()..update(updates))._build();

  _$FileRecord._(
      {this.name,
      this.owner,
      this.tags,
      this.color,
      this.created,
      this.size,
      this.fileUrl,
      this.fileExtension,
      this.ffRef})
      : super._();

  @override
  FileRecord rebuild(void Function(FileRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FileRecordBuilder toBuilder() => new FileRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FileRecord &&
        name == other.name &&
        owner == other.owner &&
        tags == other.tags &&
        color == other.color &&
        created == other.created &&
        size == other.size &&
        fileUrl == other.fileUrl &&
        fileExtension == other.fileExtension &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, name.hashCode), owner.hashCode),
                                tags.hashCode),
                            color.hashCode),
                        created.hashCode),
                    size.hashCode),
                fileUrl.hashCode),
            fileExtension.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FileRecord')
          ..add('name', name)
          ..add('owner', owner)
          ..add('tags', tags)
          ..add('color', color)
          ..add('created', created)
          ..add('size', size)
          ..add('fileUrl', fileUrl)
          ..add('fileExtension', fileExtension)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FileRecordBuilder implements Builder<FileRecord, FileRecordBuilder> {
  _$FileRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _owner;
  DocumentReference<Object?>? get owner => _$this._owner;
  set owner(DocumentReference<Object?>? owner) => _$this._owner = owner;

  String? _tags;
  String? get tags => _$this._tags;
  set tags(String? tags) => _$this._tags = tags;

  Color? _color;
  Color? get color => _$this._color;
  set color(Color? color) => _$this._color = color;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  double? _size;
  double? get size => _$this._size;
  set size(double? size) => _$this._size = size;

  String? _fileUrl;
  String? get fileUrl => _$this._fileUrl;
  set fileUrl(String? fileUrl) => _$this._fileUrl = fileUrl;

  String? _fileExtension;
  String? get fileExtension => _$this._fileExtension;
  set fileExtension(String? fileExtension) =>
      _$this._fileExtension = fileExtension;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FileRecordBuilder() {
    FileRecord._initializeBuilder(this);
  }

  FileRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _owner = $v.owner;
      _tags = $v.tags;
      _color = $v.color;
      _created = $v.created;
      _size = $v.size;
      _fileUrl = $v.fileUrl;
      _fileExtension = $v.fileExtension;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FileRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FileRecord;
  }

  @override
  void update(void Function(FileRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FileRecord build() => _build();

  _$FileRecord _build() {
    final _$result = _$v ??
        new _$FileRecord._(
            name: name,
            owner: owner,
            tags: tags,
            color: color,
            created: created,
            size: size,
            fileUrl: fileUrl,
            fileExtension: fileExtension,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
