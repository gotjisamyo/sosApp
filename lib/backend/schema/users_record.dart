import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "id_card" field.
  int? _idCard;
  int get idCard => _idCard ?? 0;
  bool hasIdCard() => _idCard != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "Government" field.
  String? _government;
  String get government => _government ?? '';
  bool hasGovernment() => _government != null;

  // "station_name" field.
  String? _stationName;
  String get stationName => _stationName ?? '';
  bool hasStationName() => _stationName != null;

  // "isOfficer" field.
  bool? _isOfficer;
  bool get isOfficer => _isOfficer ?? false;
  bool hasIsOfficer() => _isOfficer != null;

  // "last_notify_read_time" field.
  DateTime? _lastNotifyReadTime;
  DateTime? get lastNotifyReadTime => _lastNotifyReadTime;
  bool hasLastNotifyReadTime() => _lastNotifyReadTime != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _idCard = castToType<int>(snapshotData['id_card']);
    _password = snapshotData['password'] as String?;
    _government = snapshotData['Government'] as String?;
    _stationName = snapshotData['station_name'] as String?;
    _isOfficer = snapshotData['isOfficer'] as bool?;
    _lastNotifyReadTime = snapshotData['last_notify_read_time'] as DateTime?;
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
  String? phoneNumber,
  int? idCard,
  String? password,
  String? government,
  String? stationName,
  bool? isOfficer,
  DateTime? lastNotifyReadTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'id_card': idCard,
      'password': password,
      'Government': government,
      'station_name': stationName,
      'isOfficer': isOfficer,
      'last_notify_read_time': lastNotifyReadTime,
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
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.idCard == e2?.idCard &&
        e1?.password == e2?.password &&
        e1?.government == e2?.government &&
        e1?.stationName == e2?.stationName &&
        e1?.isOfficer == e2?.isOfficer &&
        e1?.lastNotifyReadTime == e2?.lastNotifyReadTime;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.idCard,
        e?.password,
        e?.government,
        e?.stationName,
        e?.isOfficer,
        e?.lastNotifyReadTime
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
