import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'files_record.g.dart';

abstract class FilesRecord implements Built<FilesRecord, FilesRecordBuilder> {
  static Serializer<FilesRecord> get serializer => _$filesRecordSerializer;

  DocumentReference? get owner;

  String? get name;

  @BuiltValueField(wireName: 'file_url')
  String? get fileUrl;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(FilesRecordBuilder builder) => builder
    ..name = ''
    ..fileUrl = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('files')
          : FirebaseFirestore.instance.collectionGroup('files');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('files').doc();

  static Stream<FilesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FilesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FilesRecord._();
  factory FilesRecord([void Function(FilesRecordBuilder) updates]) =
      _$FilesRecord;

  static FilesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFilesRecordData({
  DocumentReference? owner,
  String? name,
  String? fileUrl,
}) {
  final firestoreData = serializers.toFirestore(
    FilesRecord.serializer,
    FilesRecord(
      (f) => f
        ..owner = owner
        ..name = name
        ..fileUrl = fileUrl,
    ),
  );

  return firestoreData;
}
