import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipotato_timer_task/utils/assets.dart';

class NoTasksPlaceHolder extends StatelessWidget {
  const NoTasksPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 80),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                child: Text(
                  """No timers active.\nPress here to start a new one""",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SvgPicture.asset(Assets.arrowDown),
            ],
          ),
        ),
      ],
    );
  }
}
