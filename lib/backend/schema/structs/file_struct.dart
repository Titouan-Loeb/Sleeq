// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FileStruct extends FFFirebaseStruct {
  FileStruct({
    String? name,
    Color? color,
    String? fileUrl,
    DocumentReference? ref,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _color = color,
        _fileUrl = fileUrl,
        _ref = ref,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  // "fileUrl" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  set fileUrl(String? val) => _fileUrl = val;
  bool hasFileUrl() => _fileUrl != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? val) => _ref = val;
  bool hasRef() => _ref != null;

  static FileStruct fromMap(Map<String, dynamic> data) => FileStruct(
        name: data['name'] as String?,
        color: getSchemaColor(data['color']),
        fileUrl: data['fileUrl'] as String?,
        ref: data['ref'] as DocumentReference?,
      );

  static FileStruct? maybeFromMap(dynamic data) =>
      data is Map ? FileStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'color': _color,
        'fileUrl': _fileUrl,
        'ref': _ref,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'fileUrl': serializeParam(
          _fileUrl,
          ParamType.String,
        ),
        'ref': serializeParam(
          _ref,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static FileStruct fromSerializableMap(Map<String, dynamic> data) =>
      FileStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        fileUrl: deserializeParam(
          data['fileUrl'],
          ParamType.String,
          false,
        ),
        ref: deserializeParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users', 'files'],
        ),
      );

  static FileStruct fromAlgoliaData(Map<String, dynamic> data) => FileStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        fileUrl: convertAlgoliaParam(
          data['fileUrl'],
          ParamType.String,
          false,
        ),
        ref: convertAlgoliaParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FileStruct &&
        name == other.name &&
        color == other.color &&
        fileUrl == other.fileUrl &&
        ref == other.ref;
  }

  @override
  int get hashCode => const ListEquality().hash([name, color, fileUrl, ref]);
}

FileStruct createFileStruct({
  String? name,
  Color? color,
  String? fileUrl,
  DocumentReference? ref,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FileStruct(
      name: name,
      color: color,
      fileUrl: fileUrl,
      ref: ref,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FileStruct? updateFileStruct(
  FileStruct? file, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    file
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

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
  final clearFields = !forFieldValue && file.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fileData = getFileFirestoreData(file, forFieldValue);
  final nestedData = fileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = file.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFileFirestoreData(
  FileStruct? file, [
  bool forFieldValue = false,
]) {
  if (file == null) {
    return {};
  }
  final firestoreData = mapToFirestore(file.toMap());

  // Add any Firestore field values
  file.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFileListFirestoreData(
  List<FileStruct>? files,
) =>
    files?.map((e) => getFileFirestoreData(e, true)).toList() ?? [];
