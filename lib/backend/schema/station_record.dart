import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StationRecord extends FirestoreRecord {
  StationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "station_id" field.
  String? _stationId;
  String get stationId => _stationId ?? '';
  bool hasStationId() => _stationId != null;

  // "station_name" field.
  String? _stationName;
  String get stationName => _stationName ?? '';
  bool hasStationName() => _stationName != null;

  // "report_id" field.
  List<DocumentReference>? _reportId;
  List<DocumentReference> get reportId => _reportId ?? const [];
  bool hasReportId() => _reportId != null;

  void _initializeFields() {
    _stationId = snapshotData['station_id'] as String?;
    _stationName = snapshotData['station_name'] as String?;
    _reportId = getDataList(snapshotData['report_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('station');

  static Stream<StationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StationRecord.fromSnapshot(s));

  static Future<StationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StationRecord.fromSnapshot(s));

  static StationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStationRecordData({
  String? stationId,
  String? stationName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'station_id': stationId,
      'station_name': stationName,
    }.withoutNulls,
  );

  return firestoreData;
}

class StationRecordDocumentEquality implements Equality<StationRecord> {
  const StationRecordDocumentEquality();

  @override
  bool equals(StationRecord? e1, StationRecord? e2) {
    const listEquality = ListEquality();
    return e1?.stationId == e2?.stationId &&
        e1?.stationName == e2?.stationName &&
        listEquality.equals(e1?.reportId, e2?.reportId);
  }

  @override
  int hash(StationRecord? e) =>
      const ListEquality().hash([e?.stationId, e?.stationName, e?.reportId]);

  @override
  bool isValidKey(Object? o) => o is StationRecord;
}
