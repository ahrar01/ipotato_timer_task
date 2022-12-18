import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipotato_timer_task/utils/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(Assets.AppIconSVG, semanticsLabel: 'App Icon'),
            const SizedBox(height: 50),
            SvgPicture.asset(Assets.SplashScreenText,
                semanticsLabel: 'Splash Screen Text'),
          ]),
    );
  }
}
