import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption/signIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
 with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this,
    );

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignIn()));
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
        child: Container(
          child: Lottie.asset(
              'assets/splashscreen.json',
            repeat: false,
            controller: controller,
            onLoaded: (composition) {
                controller.forward();
            }
          ),
        ),
    ),
  );
}
