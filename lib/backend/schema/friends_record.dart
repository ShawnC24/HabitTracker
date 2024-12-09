import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FriendsRecord extends FirestoreRecord {
  FriendsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user1_id" field.
  String? _user1Id;
  String get user1Id => _user1Id ?? '';
  bool hasUser1Id() => _user1Id != null;

  // "user2_id" field.
  String? _user2Id;
  String get user2Id => _user2Id ?? '';
  bool hasUser2Id() => _user2Id != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _user1Id = snapshotData['user1_id'] as String?;
    _user2Id = snapshotData['user2_id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friends');

  static Stream<FriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendsRecord.fromSnapshot(s));

  static Future<FriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendsRecord.fromSnapshot(s));

  static FriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendsRecordData({
  String? user1Id,
  String? user2Id,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user1_id': user1Id,
      'user2_id': user2Id,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendsRecordDocumentEquality implements Equality<FriendsRecord> {
  const FriendsRecordDocumentEquality();

  @override
  bool equals(FriendsRecord? e1, FriendsRecord? e2) {
    return e1?.user1Id == e2?.user1Id &&
        e1?.user2Id == e2?.user2Id &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(FriendsRecord? e) =>
      const ListEquality().hash([e?.user1Id, e?.user2Id, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is FriendsRecord;
}
