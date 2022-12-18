import 'package:drift/drift.dart';

import '../domain/task_modal.dart';

//@UseRowClass(Task, generateInsertable: true)
class TasksTable extends Table {
  TextColumn get id => text().unique()();

  TextColumn get title => text().withLength(max: 32)();

  TextColumn get description => text()();

  IntColumn get timeLeft => integer()();

  BoolColumn get finished => boolean()();
}
