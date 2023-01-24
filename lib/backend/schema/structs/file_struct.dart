import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'file_struct.g.dart';

abstract class FileStruct implements Built<FileStruct, FileStructBuilder> {
  static Serializer<FileStruct> get serializer => _$fileStructSerializer;

  DocumentReference? get owner;

  @BuiltValueField(wireName: 'file_name')
  String? get fileName;

  @BuiltValueField(wireName: 'file_url')
  String? get fileUrl;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(FileStructBuilder builder) => builder
    ..fileName = ''
    ..fileUrl = ''
    ..firestoreUtilData = FirestoreUtilData();

  FileStruct._();
  factory FileStruct([void Function(FileStructBuilder) updates]) = _$FileStruct;
}

FileStruct createFileStruct({
  DocumentReference? owner,
  String? fileName,
  String? fileUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FileStruct(
      (f) => f
        ..owner = owner
        ..fileName = fileName
        ..fileUrl = fileUrl
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

FileStruct? updateFileStruct(
  FileStruct? file, {
  bool clearUnsetFields = true,
}) =>
    file != null
        ? (file.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addFileStructData(
  Map<String, dynamic> firestoreData,
  FileStruct? file,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (file == null) {
    return;
  }
  if (file.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && file.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fileData = getFileFirestoreData(file, forFieldValue);
  final nestedData = fileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = file.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getFileFirestoreData(
  FileStruct? file, [
  bool forFieldValue = false,
]) {
  if (file == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(FileStruct.serializer, file);

  // Add any Firestore field values
  file.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFileListFirestoreData(
  List<FileStruct>? files,
) =>
    files?.map((f) => getFileFirestoreData(f, true)).toList() ?? [];
