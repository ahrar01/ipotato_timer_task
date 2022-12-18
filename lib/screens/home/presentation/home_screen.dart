import 'package:flutter/material.dart';
import 'add_task_overlay.dart';
import 'task_view_model.dart';
import 'widgets/no_tasks_placeholder.dart';
import 'widgets/single_task_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di.iconfig.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewModel = getIt<TasksViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        flexibleSpace: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0, left: 31),
              child: Text(
                'Potato Timer',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_circle_outline_sharp,
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
        onPressed: () {
          AddTimerModal().showAddTimerModalSheet(context);
        },
      ),
      body: Observer(
        builder: (context) {
          print("changed");

          return viewModel.taskList.isEmpty
              ? const NoTasksPlaceHolder()
              : ListView.builder(
                  itemCount: viewModel.taskList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  itemBuilder: (context, i) {
                    return SingleTaskWidget(
                      task: viewModel.taskList[i],
                      onTaskStopped: () {
                        viewModel.setTaskAsComplete(index: i);
                      },
                      onTaskCompletePressed: () {
                        viewModel.setTaskAsComplete(index: i);
                      },
                      onTaskPlayed: () {
                        viewModel.reduceTaskTime(index: i);
                      },
                    );
                  },
                );
        },
      ),
    ));
  }
}
