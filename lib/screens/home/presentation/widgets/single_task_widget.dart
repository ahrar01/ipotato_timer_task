import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipotato_timer_task/utils/assets.dart';

import '../../domain/task_modal.dart';

class SingleTaskWidget extends StatelessWidget {
  final Task task;
  final VoidCallback? onTaskStopped;
  final VoidCallback? onTaskCompletePressed;
  final VoidCallback? onTaskPlayed;

  const SingleTaskWidget(
      {Key? key,
      required this.task,
      this.onTaskStopped,
      this.onTaskCompletePressed,
      this.onTaskPlayed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        color: const Color(0xffEEF5F8),
        elevation: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            if (!task.taskComplete!)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "${task.taskDuration!.inHours.toString().padLeft(2, "0")}:${task.taskDuration!.inMinutes.remainder(60).toString().padLeft(2, "0")}:${task.taskDuration!.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      key: const ValueKey("StopButton_SingleTaskWidget"),
                      padding: const EdgeInsets.all(3),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        onTaskStopped!();
                      },
                      icon: Icon(
                        Icons.stop,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      key: const ValueKey("PlayButton_SingleTaskWidget"),
                      padding: const EdgeInsets.all(3),
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        onTaskPlayed!();
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              )
            else
              Row(
                key: const ValueKey("FinishedTaskRow_SingleTaskWidget"),
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.iSoundWaveSVG),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'FINISHED',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  SvgPicture.asset(Assets.iSoundWaveSVG),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(right: 29.0, left: 32),
              child: Text(
                task.taskName!,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 29.0, left: 32),
              child: Text(
                task.taskDescription!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            if (task.taskComplete!)
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.onTertiaryContainer,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    onPressed: () {
                      onTaskCompletePressed!();
                    },
                    child: Text(
                      "Mark Complete",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onInverseSurface),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
