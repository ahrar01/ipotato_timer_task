import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_modal.freezed.dart';

@unfreezed
class Task with _$Task {
  factory Task({
     int? taskID,
     String? taskName,
     String? taskDescription,
     bool? taskComplete,
     Duration? taskDuration,
     Timer? ownTimer,
  }) = _Task;
}
