import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_modal.freezed.dart';

@unfreezed
class TaskModel with _$TaskModel {
  factory TaskModel({
    required String taskID,
    required String taskName,
    required String taskDescription,
    required bool taskComplete,
    required Duration taskDuration,
    required Timer? ownTimer,
  }) = _TaskModel;
}
