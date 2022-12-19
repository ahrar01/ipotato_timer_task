import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_modal.freezed.dart';

@unfreezed
class Task with _$Task {
  factory Task(
      {required String taskID,
      required String taskName,
      required String taskDescription,
      required bool taskComplete,
      @Default(false) bool isTimerStart,
      required Duration taskDuration,
      Timer? ownTimer}) = _Task;
}
