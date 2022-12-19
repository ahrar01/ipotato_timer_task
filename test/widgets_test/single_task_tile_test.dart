import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ipotato_timer_task/screens/home/domain/task_modal.dart';
import 'package:ipotato_timer_task/screens/home/presentation/widgets/single_task_tile.dart';

import 'material_container.dart';

void main() {
  late Widget testWidget;

  group('Testing Add Device Tile when Device is Supported', () {
    testWidgets(
        'Non Complete Task should have 2 icon buttons in SingleTaskWidget',
        (WidgetTester tester) async {
      testWidget = MaterialAppContainer(
        child: SingleTaskTile(
          task: Task(
              taskID: "Ahraar",
              taskName: "Task 1",
              taskDescription: "Task Description",
              taskComplete: false,
              taskDuration: const Duration(seconds: 5),
              ownTimer: null),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final Finder stopButton =
          find.byKey(const ValueKey("StopButton_SingleTaskWidget"));
      final Finder playButton =
          find.byKey(const ValueKey("PlayButton_SingleTaskWidget"));

      expect(stopButton, findsOneWidget);
      expect(playButton, findsOneWidget);
    });

    testWidgets('Complete Task should have Completed Row with Text FINISHED',
        (WidgetTester tester) async {
      testWidget = MaterialAppContainer(
        child: SingleTaskTile(
          task: Task(
              taskID: "Ahraar",
              taskName: "Task 1",
              taskDescription: "Task Description",
              taskComplete: true,
              taskDuration: const Duration(seconds: 5),
              ownTimer: null),
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      final Finder finishRow =
          find.byKey(const ValueKey("FinishedTaskRow_SingleTaskWidget"));
      final Finder finishText = find.text("FINISHED");

      expect(finishRow, findsOneWidget);
      expect(finishText, findsOneWidget);
    });
  });
}
