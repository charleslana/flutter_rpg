import 'package:flutter/material.dart';
import 'package:flutter_rpg/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();

    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('SplashscreenPage'),
        ),
      ),
    );
  }
}
