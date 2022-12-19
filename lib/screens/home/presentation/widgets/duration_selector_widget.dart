import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DurationSelectorWidget extends StatelessWidget {
  final Function(Duration duration) onDurationChanged;

  const DurationSelectorWidget({Key? key, required this.onDurationChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int hour = 0, min = 0, second = 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.58),
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 25,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (hourText) {
                          hour = hourText.isNotEmpty ? int.parse(hourText) : 0;
                          onDurationChanged(Duration(
                              hours: hour, minutes: min, seconds: second));
                        },
                        decoration:
                            const InputDecoration.collapsed(hintText: '00'),
                        textAlign: TextAlign.center,
                        style:  TextStyle(
                          color: Theme.of(context).colorScheme.secondary,

                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    ":",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                const SizedBox(width: 6),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              "HH",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.58),
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 25,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (minText) {
                          min = minText.isNotEmpty ? int.parse(minText) : 0;
                          onDurationChanged(Duration(
                              hours: hour, minutes: min, seconds: second));
                        },
                        decoration:
                            const InputDecoration.collapsed(hintText: '00'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    ":",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                const SizedBox(width: 6),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              "MM",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.58),
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 25,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (secText) {
                          second = secText.isNotEmpty ? int.parse(secText) : 0;
                          onDurationChanged(Duration(
                              hours: hour, minutes: min, seconds: second));
                        },
                        decoration:
                            const InputDecoration.collapsed(hintText: '00'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 3),
            Text(
              "SS",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }
}
