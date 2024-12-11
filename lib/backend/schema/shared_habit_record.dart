import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SharedHabitRecord extends FirestoreRecord {
  SharedHabitRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "habit_id" field.
  String? _habitId;
  String get habitId => _habitId ?? '';
  bool hasHabitId() => _habitId != null;

  // "receiverId" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? '';
  bool hasReceiverId() => _receiverId != null;

  // "sendId" field.
  String? _sendId;
  String get sendId => _sendId ?? '';
  bool hasSendId() => _sendId != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _habitId = snapshotData['habit_id'] as String?;
    _receiverId = snapshotData['receiverId'] as String?;
    _sendId = snapshotData['sendId'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sharedHabit');

  static Stream<SharedHabitRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SharedHabitRecord.fromSnapshot(s));

  static Future<SharedHabitRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SharedHabitRecord.fromSnapshot(s));

  static SharedHabitRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SharedHabitRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SharedHabitRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SharedHabitRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SharedHabitRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SharedHabitRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSharedHabitRecordData({
  String? habitId,
  String? receiverId,
  String? sendId,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'habit_id': habitId,
      'receiverId': receiverId,
      'sendId': sendId,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class SharedHabitRecordDocumentEquality implements Equality<SharedHabitRecord> {
  const SharedHabitRecordDocumentEquality();

  @override
  bool equals(SharedHabitRecord? e1, SharedHabitRecord? e2) {
    return e1?.habitId == e2?.habitId &&
        e1?.receiverId == e2?.receiverId &&
        e1?.sendId == e2?.sendId &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(SharedHabitRecord? e) => const ListEquality()
      .hash([e?.habitId, e?.receiverId, e?.sendId, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is SharedHabitRecord;
}
