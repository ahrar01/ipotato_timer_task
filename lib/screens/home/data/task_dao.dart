import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:ipotato_timer_task/screens/home/domain/task_modal.dart';

import '../../../core/storage/app_database.dart';

@lazySingleton
class TaskDao {
  final AppDatabase _db;
  TaskDao(this._db);

  /// "watchAllTasks() returns a Stream of all the tasks in the database."
  ///
  /// The Stream is a Dart class that allows us to listen to a stream of data. In this case, we're
  /// listening to a stream of all the tasks in the database
  ///
  /// Returns:
  ///   A Stream of a List of Task objects.
  Stream<List<Task>> watchAllTask() {
     
      return _db.select(_db.tasksTable).watch();
    
  }

  /// It returns a list of tasks from the database.
  ///
  /// Returns:
  ///   A list of Task objects.
  Future<List<Task>> getAllTask() {
    return _db.select(_db.tasksTable).get();
  }

  /// Insert the task into the database.
  ///
  /// Args:
  ///   task (Task): The task to be added to the database.
  Future<void> addTask(final Task task) async {
    await _db.into(_db.tasksTable).insert(task.toInsertable());
  }

  /// Delete the task with the given ID
  ///
  /// Args:
  ///   taskID (String): The ID of the task to be deleted.
  ///
  /// Returns:
  ///   The number of rows deleted.
  Future<void> deleteTask(int taskID) {
    return (_db.delete(_db.tasksTable)..where((t) => t.id.equals(taskID))).go();
  }

/// Update the task with the given ID with the given task.
/// 
/// Args:
///   taskID (String): The ID of the task to update.
///   task (Task): The task object to be updated.
  Future<void> updateTaskById(
      {required int taskID, required Task task}) async {
    (await _db.update(_db.tasksTable)
          ..where((t) => t.id.equals(taskID)))
        .write(task.toInsertable());
  }

  /// "Delete all the tasks from the database."
  ///
  /// The first thing we do is call the transaction() function on the _db object. This function takes a
  /// function as a parameter. The function we pass in is an async function that returns a Future
  ///
  /// Returns:
  ///   A Future<void>
  Future<void> deleteAllTasks() {
    return _db.transaction(() async {
      await _db.delete(_db.tasksTable).go();
    });
  }
}
