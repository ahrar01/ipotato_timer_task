import 'dart:async';
import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:injectable/injectable.dart';
import '../data/task_repository.dart';
import '../domain/task_modal.dart';
import 'package:mobx/mobx.dart';

import '../../../core/storage/app_database.dart';
import '../../../utils/assets.dart';
part 'task_view_model.g.dart';

@lazySingleton
class TasksViewModel extends TasksViewModelBase with _$TasksViewModel {
  TasksViewModel(final TaskRepository taskRepo) : super(taskRepo);
}

abstract class TasksViewModelBase with Store {
  final TaskRepository taskRepo;
  TasksViewModelBase(this.taskRepo) {
    /// Calling the getTasks() function.
    getTasks();
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  /// A observable list of tasks.
  @observable
  ObservableList<Task> taskList = ObservableList<Task>.of([]);

  /// It gets all the tasks from the database and adds them to the taskList.
  Future<void> getTasks() async {
    final List<TasksTableData> tasks = await taskRepo.loadAllTask();
    tasks.forEach((task) {
      taskList.add(
        Task(
            taskID: task.id,
            taskName: task.title,
            taskDescription: task.description,
            taskDuration: Duration(seconds: task.timeLeft),
            taskComplete: task.finished,
            ownTimer: null),
      );
    });
    sortList();
  }

  /// It adds a task to the taskList and then adds the task to the database
  ///
  /// Args:
  ///   task (Task): The task object that we want to add to the database.
  @action
  Future<void> addTask(Task task) async {
    taskList.add(task);
    await taskRepo.addTaskToDatabase(task);
    sortList();
  }

  /// It takes in an index of the task in the list, gets the task at that index, and then starts a timer
  /// that reduces the task's duration by 1 second every second
  ///
  /// Args:
  ///   index (int): The index of the task in the list of tasks.
  @action
  Future<void> reduceTaskTime({required int index}) async {
    final currentTask = taskList[index];
    currentTask.ownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTask.taskDuration.inSeconds > 0) {
        currentTask.isTimerStart = true;
        currentTask.taskDuration =
            Duration(seconds: currentTask.taskDuration.inSeconds - 1);

        taskRepo.updateTask(taskID: taskList[index].taskID, task: currentTask);
      } else {
        currentTask.taskComplete = true;
        currentTask.isTimerStart = false;

        taskRepo.updateTask(taskID: taskList[index].taskID, task: currentTask);
        playSound();
        timer.cancel();
      }
      sortList();
    });
  }

  /// It stops the timer of the task at the given index
  ///
  /// Args:
  ///   index (int): The index of the task in the list.
  @action
  Future<void> stopTaskTime({required int index}) async {
    final currentTask = taskList[index];
    if (currentTask.isTimerStart) {
      if (taskList[index].ownTimer != null) {
        taskList[index].ownTimer!.cancel();
        taskList[index].isTimerStart = false;
      }
      await taskRepo.updateTask(
          taskID: taskList[index].taskID, task: currentTask);
    }
    sortList();
  }

  void sortList() {
    taskList.sort((a, b) {
      if (b.taskComplete) {
        return 1;
      }
      return -1;
    });
    taskList = taskList;
  }

  /// It deletes the task from the database and removes it from the list
  ///
  /// Args:
  ///   index (int): The index of the task in the taskList.
  @action
  Future<void> setTaskAsComplete({required int index}) async {
    if (taskList[index].ownTimer != null) taskList[index].ownTimer!.cancel();
    await taskRepo.deleteTaskFromDatabase(taskList[index].taskID);
    taskList.removeAt(index);
    sortList();
    assetsAudioPlayer.stop();
  }

  /// Play the sound file located in the assets folder.
  void playSound() {
    try {
      assetsAudioPlayer.stop();
      assetsAudioPlayer.open(
        Audio(
          Assets.neverGonnaGiveYouSound,
        ),
        showNotification: true,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
