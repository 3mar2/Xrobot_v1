import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// import 'package:vidioplayer/pages/myvidioplayer.dart';

import '../login.dart';

class splashScren extends StatelessWidget {
  const splashScren({super.key});
  get splash => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Center(
              child: LottieBuilder.asset("assets/Lottie/car_robot.json"),
            )
          ],
        ),
        nextScreen:const LogInPage(),
        splashIconSize: 400,);
  }
}
