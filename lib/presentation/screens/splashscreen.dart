import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

import 'package:leafy/presentation/screens/landing_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: const LandingScreen(),
      imageBackground: const AssetImage("assets/images/splashscreen1.jpg"),
    );
  }
}
