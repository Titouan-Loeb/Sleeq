// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchResultStruct extends FFFirebaseStruct {
  SearchResultStruct({
    Color? color,
    String? name,
    DocumentReference? path,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _color = color,
        _name = name,
        _path = path,
        super(firestoreUtilData);

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "path" field.
  DocumentReference? _path;
  DocumentReference? get path => _path;
  set path(DocumentReference? val) => _path = val;
  bool hasPath() => _path != null;

  static SearchResultStruct fromMap(Map<String, dynamic> data) =>
      SearchResultStruct(
        color: getSchemaColor(data['color']),
        name: data['name'] as String?,
        path: data['path'] as DocumentReference?,
      );

  static SearchResultStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'color': _color,
        'name': _name,
        'path': _path,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static SearchResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchResultStruct(
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users', 'files'],
        ),
      );

  static SearchResultStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SearchResultStruct(
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        path: convertAlgoliaParam(
          data['path'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SearchResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchResultStruct &&
        color == other.color &&
        name == other.name &&
        path == other.path;
  }

  @override
  int get hashCode => const ListEquality().hash([color, name, path]);
}

SearchResultStruct createSearchResultStruct({
  Color? color,
  String? name,
  DocumentReference? path,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchResultStruct(
      color: color,
      name: name,
      path: path,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchResultStruct? updateSearchResultStruct(
  SearchResultStruct? searchResult, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchResult
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchResultStructData(
  Map<String, dynamic> firestoreData,
  SearchResultStruct? searchResult,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchResult == null) {
    return;
  }
  if (searchResult.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchResult.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchResultData =
      getSearchResultFirestoreData(searchResult, forFieldValue);
  final nestedData =
      searchResultData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = searchResult.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchResultFirestoreData(
  SearchResultStruct? searchResult, [
  bool forFieldValue = false,
]) {
  if (searchResult == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchResult.toMap());

  // Add any Firestore field values
  searchResult.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchResultListFirestoreData(
  List<SearchResultStruct>? searchResults,
) =>
    searchResults?.map((e) => getSearchResultFirestoreData(e, true)).toList() ??
    [];
