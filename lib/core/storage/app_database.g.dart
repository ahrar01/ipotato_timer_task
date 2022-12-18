// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class TasksTableData extends DataClass implements Insertable<TasksTableData> {
  final String id;
  final String title;
  final String description;
  final int timeLeft;
  final bool finished;
  const TasksTableData(
      {required this.id,
      required this.title,
      required this.description,
      required this.timeLeft,
      required this.finished});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['time_left'] = Variable<int>(timeLeft);
    map['finished'] = Variable<bool>(finished);
    return map;
  }

  TasksTableCompanion toCompanion(bool nullToAbsent) {
    return TasksTableCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      timeLeft: Value(timeLeft),
      finished: Value(finished),
    );
  }

  factory TasksTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TasksTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      timeLeft: serializer.fromJson<int>(json['timeLeft']),
      finished: serializer.fromJson<bool>(json['finished']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'timeLeft': serializer.toJson<int>(timeLeft),
      'finished': serializer.toJson<bool>(finished),
    };
  }

  TasksTableData copyWith(
          {String? id,
          String? title,
          String? description,
          int? timeLeft,
          bool? finished}) =>
      TasksTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        timeLeft: timeLeft ?? this.timeLeft,
        finished: finished ?? this.finished,
      );
  @override
  String toString() {
    return (StringBuffer('TasksTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('timeLeft: $timeLeft, ')
          ..write('finished: $finished')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, timeLeft, finished);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TasksTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.timeLeft == this.timeLeft &&
          other.finished == this.finished);
}

class TasksTableCompanion extends UpdateCompanion<TasksTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<int> timeLeft;
  final Value<bool> finished;
  const TasksTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.timeLeft = const Value.absent(),
    this.finished = const Value.absent(),
  });
  TasksTableCompanion.insert({
    required String id,
    required String title,
    required String description,
    required int timeLeft,
    required bool finished,
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        timeLeft = Value(timeLeft),
        finished = Value(finished);
  static Insertable<TasksTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? timeLeft,
    Expression<bool>? finished,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (timeLeft != null) 'time_left': timeLeft,
      if (finished != null) 'finished': finished,
    });
  }

  TasksTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<int>? timeLeft,
      Value<bool>? finished}) {
    return TasksTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      timeLeft: timeLeft ?? this.timeLeft,
      finished: finished ?? this.finished,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (timeLeft.present) {
      map['time_left'] = Variable<int>(timeLeft.value);
    }
    if (finished.present) {
      map['finished'] = Variable<bool>(finished.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('timeLeft: $timeLeft, ')
          ..write('finished: $finished')
          ..write(')'))
        .toString();
  }
}

class $TasksTableTable extends TasksTable
    with TableInfo<$TasksTableTable, TasksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeLeftMeta =
      const VerificationMeta('timeLeft');
  @override
  late final GeneratedColumn<int> timeLeft = GeneratedColumn<int>(
      'time_left', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _finishedMeta =
      const VerificationMeta('finished');
  @override
  late final GeneratedColumn<bool> finished =
      GeneratedColumn<bool>('finished', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("finished" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, timeLeft, finished];
  @override
  String get aliasedName => _alias ?? 'tasks_table';
  @override
  String get actualTableName => 'tasks_table';
  @override
  VerificationContext validateIntegrity(Insertable<TasksTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('time_left')) {
      context.handle(_timeLeftMeta,
          timeLeft.isAcceptableOrUnknown(data['time_left']!, _timeLeftMeta));
    } else if (isInserting) {
      context.missing(_timeLeftMeta);
    }
    if (data.containsKey('finished')) {
      context.handle(_finishedMeta,
          finished.isAcceptableOrUnknown(data['finished']!, _finishedMeta));
    } else if (isInserting) {
      context.missing(_finishedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TasksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TasksTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      timeLeft: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_left'])!,
      finished: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}finished'])!,
    );
  }

  @override
  $TasksTableTable createAlias(String alias) {
    return $TasksTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TasksTableTable tasksTable = $TasksTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasksTable];
}
