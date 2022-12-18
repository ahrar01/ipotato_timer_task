import 'package:injectable/injectable.dart';
import '../../../core/storage/app_database.dart';
import 'task_dao.dart';

import '../domain/task_modal.dart';

@lazySingleton
class TaskRepository {
  final TaskDao taskDao;
  TaskRepository(this.taskDao);

  Future<List<TasksTableData>> loadAllTask() async {
    return taskDao.getAllTask();
  }

  Future<void> addTaskToDatabase(Task task) async {
    await taskDao.addTask(task);
  }

  Future<void> deleteTaskFromDatabase(String taskID) async {
    await taskDao.deleteTask(taskID);
  }

  Future<void> updateTask({required String taskID, required Task task}) async {
    await taskDao.updateTaskById(taskID: taskID, task: task);
  }
}
