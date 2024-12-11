import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddFriendsRecord extends FirestoreRecord {
  AddFriendsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "receiverId" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? '';
  bool hasReceiverId() => _receiverId != null;

  // "sendId" field.
  String? _sendId;
  String get sendId => _sendId ?? '';
  bool hasSendId() => _sendId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _receiverId = snapshotData['receiverId'] as String?;
    _sendId = snapshotData['sendId'] as String?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('addFriends');

  static Stream<AddFriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AddFriendsRecord.fromSnapshot(s));

  static Future<AddFriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AddFriendsRecord.fromSnapshot(s));

  static AddFriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AddFriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AddFriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AddFriendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AddFriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AddFriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAddFriendsRecordData({
  String? receiverId,
  String? sendId,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'receiverId': receiverId,
      'sendId': sendId,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class AddFriendsRecordDocumentEquality implements Equality<AddFriendsRecord> {
  const AddFriendsRecordDocumentEquality();

  @override
  bool equals(AddFriendsRecord? e1, AddFriendsRecord? e2) {
    return e1?.receiverId == e2?.receiverId &&
        e1?.sendId == e2?.sendId &&
        e1?.status == e2?.status;
  }

  @override
  int hash(AddFriendsRecord? e) =>
      const ListEquality().hash([e?.receiverId, e?.sendId, e?.status]);

  @override
  bool isValidKey(Object? o) => o is AddFriendsRecord;
}
