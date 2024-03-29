import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportToStationRecord extends FirestoreRecord {
  ReportToStationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_photo" field.
  String? _postPhoto;
  String get postPhoto => _postPhoto ?? '';
  bool hasPostPhoto() => _postPhoto != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "position" field.
  LatLng? _position;
  LatLng? get position => _position;
  bool hasPosition() => _position != null;

  // "station_id" field.
  String? _stationId;
  String get stationId => _stationId ?? '';
  bool hasStationId() => _stationId != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _postPhoto = snapshotData['post_photo'] as String?;
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _position = snapshotData['position'] as LatLng?;
    _stationId = snapshotData['station_id'] as String?;
    _status = snapshotData['status'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Report_To_Station')
          : FirebaseFirestore.instance.collectionGroup('Report_To_Station');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Report_To_Station').doc(id);

  static Stream<ReportToStationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportToStationRecord.fromSnapshot(s));

  static Future<ReportToStationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportToStationRecord.fromSnapshot(s));

  static ReportToStationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportToStationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportToStationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportToStationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportToStationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportToStationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportToStationRecordData({
  String? postPhoto,
  String? postTitle,
  String? postDescription,
  DocumentReference? postUser,
  DateTime? timePosted,
  LatLng? position,
  String? stationId,
  bool? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_photo': postPhoto,
      'post_title': postTitle,
      'post_description': postDescription,
      'post_user': postUser,
      'time_posted': timePosted,
      'position': position,
      'station_id': stationId,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportToStationRecordDocumentEquality
    implements Equality<ReportToStationRecord> {
  const ReportToStationRecordDocumentEquality();

  @override
  bool equals(ReportToStationRecord? e1, ReportToStationRecord? e2) {
    return e1?.postPhoto == e2?.postPhoto &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.postUser == e2?.postUser &&
        e1?.timePosted == e2?.timePosted &&
        e1?.position == e2?.position &&
        e1?.stationId == e2?.stationId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ReportToStationRecord? e) => const ListEquality().hash([
        e?.postPhoto,
        e?.postTitle,
        e?.postDescription,
        e?.postUser,
        e?.timePosted,
        e?.position,
        e?.stationId,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportToStationRecord;
}
