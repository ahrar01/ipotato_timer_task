import 'package:flutter/material.dart';
import 'package:ipotato_timer_task/screens/home/presentation/task_view_model.dart';
import 'package:ipotato_timer_task/screens/home/presentation/widgets/no_tasks_placeholder.dart';
import 'package:ipotato_timer_task/screens/home/presentation/widgets/single_task_widget.dart';
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
        onPressed: () {},
      ),
      body: Observer(
        builder: (context) {
          print("changed");

          return viewModel.taskList.isEmpty
              ? const NoTasksPlaceHolder()
              : ListView.builder(
                  itemCount: viewModel.taskList.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20),
                      child: SingleTaskWidget(
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
                      ),
                    );
                  },
                );
        },
      ),
    ));
  }
}
