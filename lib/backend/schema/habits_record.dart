import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HabitsRecord extends FirestoreRecord {
  HabitsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "frequency" field.
  String? _frequency;
  String get frequency => _frequency ?? '';
  bool hasFrequency() => _frequency != null;

  // "reminderTime" field.
  DateTime? _reminderTime;
  DateTime? get reminderTime => _reminderTime;
  bool hasReminderTime() => _reminderTime != null;

  // "isCompleted" field.
  bool? _isCompleted;
  bool get isCompleted => _isCompleted ?? false;
  bool hasIsCompleted() => _isCompleted != null;

  // "iconSymbol" field.
  String? _iconSymbol;
  String get iconSymbol => _iconSymbol ?? '';
  bool hasIconSymbol() => _iconSymbol != null;

  // "units" field.
  String? _units;
  String get units => _units ?? '';
  bool hasUnits() => _units != null;

  // "habit_id" field.
  String? _habitId;
  String get habitId => _habitId ?? '';
  bool hasHabitId() => _habitId != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "goal" field.
  String? _goal;
  String get goal => _goal ?? '';
  bool hasGoal() => _goal != null;

  // "habitStatus" field.
  String? _habitStatus;
  String get habitStatus => _habitStatus ?? '';
  bool hasHabitStatus() => _habitStatus != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _frequency = snapshotData['frequency'] as String?;
    _reminderTime = snapshotData['reminderTime'] as DateTime?;
    _isCompleted = snapshotData['isCompleted'] as bool?;
    _iconSymbol = snapshotData['iconSymbol'] as String?;
    _units = snapshotData['units'] as String?;
    _habitId = snapshotData['habit_id'] as String?;
    _uid = snapshotData['uid'] as String?;
    _goal = snapshotData['goal'] as String?;
    _habitStatus = snapshotData['habitStatus'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('habits');

  static Stream<HabitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HabitsRecord.fromSnapshot(s));

  static Future<HabitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HabitsRecord.fromSnapshot(s));

  static HabitsRecord fromSnapshot(DocumentSnapshot snapshot) => HabitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HabitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HabitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HabitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HabitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHabitsRecordData({
  String? name,
  String? description,
  String? frequency,
  DateTime? reminderTime,
  bool? isCompleted,
  String? iconSymbol,
  String? units,
  String? habitId,
  String? uid,
  String? goal,
  String? habitStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'frequency': frequency,
      'reminderTime': reminderTime,
      'isCompleted': isCompleted,
      'iconSymbol': iconSymbol,
      'units': units,
      'habit_id': habitId,
      'uid': uid,
      'goal': goal,
      'habitStatus': habitStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class HabitsRecordDocumentEquality implements Equality<HabitsRecord> {
  const HabitsRecordDocumentEquality();

  @override
  bool equals(HabitsRecord? e1, HabitsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.frequency == e2?.frequency &&
        e1?.reminderTime == e2?.reminderTime &&
        e1?.isCompleted == e2?.isCompleted &&
        e1?.iconSymbol == e2?.iconSymbol &&
        e1?.units == e2?.units &&
        e1?.habitId == e2?.habitId &&
        e1?.uid == e2?.uid &&
        e1?.goal == e2?.goal &&
        e1?.habitStatus == e2?.habitStatus;
  }

  @override
  int hash(HabitsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.frequency,
        e?.reminderTime,
        e?.isCompleted,
        e?.iconSymbol,
        e?.units,
        e?.habitId,
        e?.uid,
        e?.goal,
        e?.habitStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is HabitsRecord;
}
