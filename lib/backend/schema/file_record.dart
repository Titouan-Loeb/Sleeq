import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'file_record.g.dart';

abstract class FileRecord implements Built<FileRecord, FileRecordBuilder> {
  static Serializer<FileRecord> get serializer => _$fileRecordSerializer;

  String? get name;

  DocumentReference? get owner;

  String? get tags;

  Color? get color;

  DateTime? get created;

  double? get size;

  @BuiltValueField(wireName: 'file_url')
  String? get fileUrl;

  @BuiltValueField(wireName: 'file_extension')
  String? get fileExtension;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FileRecordBuilder builder) => builder
    ..name = ''
    ..tags = ''
    ..size = 0.0
    ..fileUrl = ''
    ..fileExtension = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('file');

  static Stream<FileRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FileRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FileRecord._();
  factory FileRecord([void Function(FileRecordBuilder) updates]) = _$FileRecord;

  static FileRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFileRecordData({
  String? name,
  DocumentReference? owner,
  String? tags,
  Color? color,
  DateTime? created,
  double? size,
  String? fileUrl,
  String? fileExtension,
}) {
  final firestoreData = serializers.toFirestore(
    FileRecord.serializer,
    FileRecord(
      (f) => f
        ..name = name
        ..owner = owner
        ..tags = tags
        ..color = color
        ..created = created
        ..size = size
        ..fileUrl = fileUrl
        ..fileExtension = fileExtension,
    ),
  );

  return firestoreData;
}
