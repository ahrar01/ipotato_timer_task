import 'package:injectable/injectable.dart';
import 'package:ipotato_timer_task/screens/home/data/task_dao.dart';

import '../domain/task_modal.dart';

@lazySingleton
class TaskRepository {
  final TaskDao taskDao;
  TaskRepository(this.taskDao);

  Future<List<Task>> loadAllTask() {
    return taskDao.getAllTask();
  }

  Future<void> addTaskToDatabase(Task task) async {
    await taskDao.addTask(task);
  }

  Future<void> deleteTaskFromDatabase(int taskID) async {
    await taskDao.deleteTask(taskID);
  }
  Future<void> updateTask({required int taskID, required Task task}) async {
    await taskDao.updateTaskById(taskID: taskID,task: task);
  }

  Stream<List<Task>> streamAllTask() {
    return taskDao.watchAllTask();
  }
 
}
