//Extensions
import '../screens/home/domain/task_modal.dart';


String getTaskTime(Task task) {
  return "${task.taskDuration.inHours.toString().padLeft(2, "0")}:${task.taskDuration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${task.taskDuration.inSeconds.remainder(60).toString().padLeft(2, "0")}";
}
