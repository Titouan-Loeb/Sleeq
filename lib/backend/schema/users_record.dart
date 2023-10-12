import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "occupied_size" field.
  double? _occupiedSize;
  double get occupiedSize => _occupiedSize ?? 0.0;
  bool hasOccupiedSize() => _occupiedSize != null;

  // "is_subscriber" field.
  bool? _isSubscriber;
  bool get isSubscriber => _isSubscriber ?? false;
  bool hasIsSubscriber() => _isSubscriber != null;

  // "root_folder" field.
  DocumentReference? _rootFolder;
  DocumentReference? get rootFolder => _rootFolder;
  bool hasRootFolder() => _rootFolder != null;

  // "english" field.
  bool? _english;
  bool get english => _english ?? false;
  bool hasEnglish() => _english != null;

  // "subcription_id" field.
  String? _subcriptionId;
  String get subcriptionId => _subcriptionId ?? '';
  bool hasSubcriptionId() => _subcriptionId != null;

  // "is_colorblind" field.
  bool? _isColorblind;
  bool get isColorblind => _isColorblind ?? false;
  bool hasIsColorblind() => _isColorblind != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _occupiedSize = castToType<double>(snapshotData['occupied_size']);
    _isSubscriber = snapshotData['is_subscriber'] as bool?;
    _rootFolder = snapshotData['root_folder'] as DocumentReference?;
    _english = snapshotData['english'] as bool?;
    _subcriptionId = snapshotData['subcription_id'] as String?;
    _isColorblind = snapshotData['is_colorblind'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'occupied_size': convertAlgoliaParam(
            snapshot.data['occupied_size'],
            ParamType.double,
            false,
          ),
          'is_subscriber': snapshot.data['is_subscriber'],
          'root_folder': convertAlgoliaParam(
            snapshot.data['root_folder'],
            ParamType.DocumentReference,
            false,
          ),
          'english': snapshot.data['english'],
          'subcription_id': snapshot.data['subcription_id'],
          'is_colorblind': snapshot.data['is_colorblind'],
          'phone_number': snapshot.data['phone_number'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  double? occupiedSize,
  bool? isSubscriber,
  DocumentReference? rootFolder,
  bool? english,
  String? subcriptionId,
  bool? isColorblind,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'occupied_size': occupiedSize,
      'is_subscriber': isSubscriber,
      'root_folder': rootFolder,
      'english': english,
      'subcription_id': subcriptionId,
      'is_colorblind': isColorblind,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.occupiedSize == e2?.occupiedSize &&
        e1?.isSubscriber == e2?.isSubscriber &&
        e1?.rootFolder == e2?.rootFolder &&
        e1?.english == e2?.english &&
        e1?.subcriptionId == e2?.subcriptionId &&
        e1?.isColorblind == e2?.isColorblind &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.occupiedSize,
        e?.isSubscriber,
        e?.rootFolder,
        e?.english,
        e?.subcriptionId,
        e?.isColorblind,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
