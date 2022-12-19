import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer_task/core/di.iconfig.dart';
import 'package:ipotato_timer_task/screens/home/domain/task_modal.dart';
import 'package:ipotato_timer_task/screens/home/presentation/task_view_model.dart';

import '../core/di.injection.dart';

void main() {
  const channel = MethodChannel('assets_audio_player');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  setUp(() async {
    await configureInjectionTestDependencies();
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() async {
    await getIt.reset();
    channel.setMockMethodCallHandler(null);
  });
  group('Task', () {
    test('should return nothing when the list is empty', () async {
      final viewModel = getIt<TasksViewModel>();
      expect(viewModel.taskList, []);
    });

    test('should return list of task when the list is not empty', () async {
      final viewModel = getIt<TasksViewModel>();
      viewModel.addTask(Task(
          taskID: "1",
          taskName: "Task 1",
          taskDescription: "Task Description",
          taskComplete: false,
          taskDuration: const Duration(seconds: 1),
          ownTimer: null));

      expect(viewModel.taskList.length, 1);
    });

    test('check if the task is completed', () async {
      final viewModel = getIt<TasksViewModel>();

      //Adding task
      viewModel.addTask(Task(
          taskID: "1",
          taskName: "Task 1",
          taskDescription: "Task Description",
          taskComplete: false,
          taskDuration: const Duration(seconds: 1),
          ownTimer: null));
      //start the timer
      viewModel.reduceTaskTime(index: 0);
      //wait for the timer to complete
      await Future.delayed(const Duration(seconds: 3));

      expect(viewModel.taskList[0].taskComplete, true);
    });

    test('stop the task timer if its active', () async {
      final viewModel = getIt<TasksViewModel>();

      //Adding task
      viewModel.addTask(Task(
          taskID: "1",
          taskName: "Task 1",
          taskDescription: "Task Description",
          taskComplete: false,
          taskDuration: const Duration(seconds: 3),
          ownTimer: null));
      //start the timer
      viewModel.reduceTaskTime(index: 0);

      //stopping the timer
      viewModel.stopTaskTime(index: 0);

      expect(viewModel.taskList[0].isTimerStart, false);
    });
  });
}
