// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColorStruct extends FFFirebaseStruct {
  ColorStruct({
    Color? color,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _color = color,
        super(firestoreUtilData);

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;
  bool hasColor() => _color != null;

  static ColorStruct fromMap(Map<String, dynamic> data) => ColorStruct(
        color: getSchemaColor(data['color']),
      );

  static ColorStruct? maybeFromMap(dynamic data) =>
      data is Map ? ColorStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'color': _color,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
      }.withoutNulls;

  static ColorStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColorStruct(
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
      );

  static ColorStruct fromAlgoliaData(Map<String, dynamic> data) => ColorStruct(
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ColorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColorStruct && color == other.color;
  }

  @override
  int get hashCode => const ListEquality().hash([color]);
}

ColorStruct createColorStruct({
  Color? color,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ColorStruct(
      color: color,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ColorStruct? updateColorStruct(
  ColorStruct? colorStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    colorStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addColorStructData(
  Map<String, dynamic> firestoreData,
  ColorStruct? colorStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (colorStruct == null) {
    return;
  }
  if (colorStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && colorStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final colorStructData = getColorFirestoreData(colorStruct, forFieldValue);
  final nestedData =
      colorStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = colorStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getColorFirestoreData(
  ColorStruct? colorStruct, [
  bool forFieldValue = false,
]) {
  if (colorStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(colorStruct.toMap());

  // Add any Firestore field values
  colorStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getColorListFirestoreData(
  List<ColorStruct>? colorStructs,
) =>
    colorStructs?.map((e) => getColorFirestoreData(e, true)).toList() ?? [];
