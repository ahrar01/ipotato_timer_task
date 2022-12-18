import 'package:injectable/injectable.dart';
import '../domain/task_modal.dart';

import '../../../core/storage/app_database.dart';

@lazySingleton
class TaskDao {
  final AppDatabase _db;
  TaskDao(this._db);

  /// It returns a list of tasks from the database.
  ///
  /// Returns:
  ///   A list of Task objects.
  Future<List<TasksTableData>> getAllTask() async {
    return  _db.select(_db.tasksTable).get();
  }

  /// Insert the task into the database.
  ///
  /// Args:
  ///   task (Task): The task to be added to the database.
  Future<void> addTask(final Task task) async {
    try {
      await _db.into(_db.tasksTable).insert(TasksTableData(
          id: task.taskID,
          title: task.taskName,
          description: task.taskDescription,
          timeLeft: task.taskDuration.inSeconds,
          finished: task.taskComplete));
    } catch (e) {
      print("error :: " + e.toString());
    }
  }

  /// Delete the task with the given ID
  ///
  /// Args:
  ///   taskID (String): The ID of the task to be deleted.
  ///
  /// Returns:
  ///   The number of rows deleted.
  Future<void> deleteTask(String taskID) {
    return (_db.delete(_db.tasksTable)..where((t) => t.id.equals(taskID))).go();
  }

  /// Update the task with the given ID with the given task.
  ///
  /// Args:
  ///   taskID (String): The ID of the task to update.
  ///   task (Task): The task object to be updated.
  Future<void> updateTaskById(
      {required String taskID, required Task task}) async {
    (await _db.update(_db.tasksTable)
          ..where((t) => t.id.equals(taskID)))
        .write(TasksTableData(
            id: task.taskID,
            title: task.taskName,
            description: task.taskDescription,
            timeLeft: task.taskDuration.inSeconds,
            finished: task.taskComplete));
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
