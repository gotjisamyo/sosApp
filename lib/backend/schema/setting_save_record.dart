import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettingSaveRecord extends FirestoreRecord {
  SettingSaveRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "volume" field.
  int? _volume;
  int get volume => _volume ?? 0;
  bool hasVolume() => _volume != null;

  // "allow_location" field.
  bool? _allowLocation;
  bool get allowLocation => _allowLocation ?? false;
  bool hasAllowLocation() => _allowLocation != null;

  // "allow_notify" field.
  bool? _allowNotify;
  bool get allowNotify => _allowNotify ?? false;
  bool hasAllowNotify() => _allowNotify != null;

  // "allow_call" field.
  bool? _allowCall;
  bool get allowCall => _allowCall ?? false;
  bool hasAllowCall() => _allowCall != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _volume = castToType<int>(snapshotData['volume']);
    _allowLocation = snapshotData['allow_location'] as bool?;
    _allowNotify = snapshotData['allow_notify'] as bool?;
    _allowCall = snapshotData['allow_call'] as bool?;
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('settingSave');

  static Stream<SettingSaveRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SettingSaveRecord.fromSnapshot(s));

  static Future<SettingSaveRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SettingSaveRecord.fromSnapshot(s));

  static SettingSaveRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SettingSaveRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SettingSaveRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SettingSaveRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SettingSaveRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SettingSaveRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSettingSaveRecordData({
  int? volume,
  bool? allowLocation,
  bool? allowNotify,
  bool? allowCall,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'volume': volume,
      'allow_location': allowLocation,
      'allow_notify': allowNotify,
      'allow_call': allowCall,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class SettingSaveRecordDocumentEquality implements Equality<SettingSaveRecord> {
  const SettingSaveRecordDocumentEquality();

  @override
  bool equals(SettingSaveRecord? e1, SettingSaveRecord? e2) {
    return e1?.volume == e2?.volume &&
        e1?.allowLocation == e2?.allowLocation &&
        e1?.allowNotify == e2?.allowNotify &&
        e1?.allowCall == e2?.allowCall &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(SettingSaveRecord? e) => const ListEquality().hash(
      [e?.volume, e?.allowLocation, e?.allowNotify, e?.allowCall, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is SettingSaveRecord;
}
