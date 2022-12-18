import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:injectable/injectable.dart';
import 'package:ipotato_timer_task/screens/home/data/task_repository.dart';
import 'package:ipotato_timer_task/screens/home/domain/task_modal.dart';
import 'package:mobx/mobx.dart';

import '../../../utils/assets.dart';
part 'task_view_model.g.dart';

@injectable
class TasksViewModel extends TasksViewModelBase with _$TasksViewModel {
  TasksViewModel(final TaskRepository taskRepo) : super(taskRepo);
}

abstract class TasksViewModelBase with Store {
  final TaskRepository taskRepo;
  TasksViewModelBase(this.taskRepo) {
    getTasks();
  }

/// A observable list of tasks.
  @observable
  ObservableList<Task> taskList = ObservableList<Task>.of([]);

/// It gets all the tasks from the database and adds them to the taskList.
  Future<void> getTasks() async {
    final tasks = await taskRepo.loadAllTask();
    taskList.addAll(tasks.asObservable());
  }

  Stream<List<Task>> streamAllTask() {
    return taskRepo.streamAllTask();
  }

  /// It takes in an index of the task in the list, gets the task at that index, and then starts a timer
  /// that reduces the task's duration by 1 second every second
  /// 
  /// Args:
  ///   index (int): The index of the task in the list of tasks.
  @action
  Future<void> reduceTaskTime({required int index}) async {
    final currentTask = taskList[index];

    currentTask.ownTimer =
        Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (currentTask.taskDuration!.inSeconds > 0) {
        currentTask.taskDuration =
            Duration(seconds: currentTask.taskDuration!.inSeconds - 1);

        await taskRepo.updateTask(
            taskID: taskList[index].taskID!, task: currentTask);
      } else {
        currentTask.taskComplete = true;
        await taskRepo.updateTask(
            taskID: taskList[index].taskID!, task: currentTask);
        playSound();
        timer.cancel();
      }
    });
  }

  @action
  Future<void> setTaskAsComplete({required int index}) async {
    if (taskList[index].ownTimer != null) taskList[index].ownTimer!.cancel();
    await taskRepo.deleteTaskFromDatabase(taskList[index].taskID!);
    taskList.removeAt(index);
  }

  void playSound() {
    AssetsAudioPlayer().open(
      Audio(Assets.neverGonnaGiveYouSound),
    );
  }
}
