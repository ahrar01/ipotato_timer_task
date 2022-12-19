import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ipotato_timer_task/core/di.iconfig.dart';
import 'package:ipotato_timer_task/main.dart';
import 'package:ipotato_timer_task/screens/home/presentation/home_screen.dart';

Future<void> main() async {
  final binding =
      await IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  setUp(() async {
    await configureInjection();
  });
  tearDown(() async {
    await getIt.reset();
  });
  testWidgets('Integration Test for Add Task ', (tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey("floatingActionButtonKey")));

    await tester.pumpAndSettle();

    final titleField = find.ancestor(
        of: find.text('Title'), matching: find.byType(TextFormField));

    await tester.enterText(titleField, 'Task 1');

    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    final descriptionField = find.ancestor(
        of: find.text('Description'), matching: find.byType(TextFormField));

    await tester.enterText(descriptionField, 'Description 1');

    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    final secondsTime = find.byKey(const ValueKey("secondsTimeKey"));

    await tester.enterText(secondsTime, '03');

    await tester.pumpAndSettle(const Duration(milliseconds: 300));
    final Finder buttonToTap = find.byKey(const Key('addTaskButtonKey'));

    await tester.ensureVisible(buttonToTap);
    await tester.pumpAndSettle();

    await tester.tap(buttonToTap);

    await tester.pumpAndSettle(const Duration(milliseconds: 300));

    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byIcon(Icons.add_circle_outline_sharp), findsOneWidget);
    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Description 1'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsNothing);
  });
}
