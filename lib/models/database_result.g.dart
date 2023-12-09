// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_result.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DatabaseResult extends _DatabaseResult
    with RealmEntity, RealmObjectBase, RealmObject {
  DatabaseResult(
    String courseCode,
    String grade,
    double gradePoint,
    int courseYear,
    int credits,
    bool isNonGPA,
    double gradePoints,
    int gpaCredits,
  ) {
    RealmObjectBase.set(this, 'courseCode', courseCode);
    RealmObjectBase.set(this, 'grade', grade);
    RealmObjectBase.set(this, 'gradePoint', gradePoint);
    RealmObjectBase.set(this, 'courseYear', courseYear);
    RealmObjectBase.set(this, 'credits', credits);
    RealmObjectBase.set(this, 'isNonGPA', isNonGPA);
    RealmObjectBase.set(this, 'gradePoints', gradePoints);
    RealmObjectBase.set(this, 'gpaCredits', gpaCredits);
  }

  DatabaseResult._();

  @override
  String get courseCode =>
      RealmObjectBase.get<String>(this, 'courseCode') as String;
  @override
  set courseCode(String value) => throw RealmUnsupportedSetError();

  @override
  String get grade => RealmObjectBase.get<String>(this, 'grade') as String;
  @override
  set grade(String value) => RealmObjectBase.set(this, 'grade', value);

  @override
  double get gradePoint =>
      RealmObjectBase.get<double>(this, 'gradePoint') as double;
  @override
  set gradePoint(double value) =>
      RealmObjectBase.set(this, 'gradePoint', value);

  @override
  int get courseYear => RealmObjectBase.get<int>(this, 'courseYear') as int;
  @override
  set courseYear(int value) => RealmObjectBase.set(this, 'courseYear', value);

  @override
  int get credits => RealmObjectBase.get<int>(this, 'credits') as int;
  @override
  set credits(int value) => RealmObjectBase.set(this, 'credits', value);

  @override
  bool get isNonGPA => RealmObjectBase.get<bool>(this, 'isNonGPA') as bool;
  @override
  set isNonGPA(bool value) => RealmObjectBase.set(this, 'isNonGPA', value);

  @override
  double get gradePoints =>
      RealmObjectBase.get<double>(this, 'gradePoints') as double;
  @override
  set gradePoints(double value) =>
      RealmObjectBase.set(this, 'gradePoints', value);

  @override
  int get gpaCredits => RealmObjectBase.get<int>(this, 'gpaCredits') as int;
  @override
  set gpaCredits(int value) => RealmObjectBase.set(this, 'gpaCredits', value);

  @override
  Stream<RealmObjectChanges<DatabaseResult>> get changes =>
      RealmObjectBase.getChanges<DatabaseResult>(this);

  @override
  DatabaseResult freeze() => RealmObjectBase.freezeObject<DatabaseResult>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DatabaseResult._);
    return const SchemaObject(
        ObjectType.realmObject, DatabaseResult, 'DatabaseResult', [
      SchemaProperty('courseCode', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('grade', RealmPropertyType.string),
      SchemaProperty('gradePoint', RealmPropertyType.double),
      SchemaProperty('courseYear', RealmPropertyType.int),
      SchemaProperty('credits', RealmPropertyType.int),
      SchemaProperty('isNonGPA', RealmPropertyType.bool),
      SchemaProperty('gradePoints', RealmPropertyType.double),
      SchemaProperty('gpaCredits', RealmPropertyType.int),
    ]);
  }
}
