import 'package:flutter/material.dart';
import 'package:flutter_rpg/constants/image_constant.dart';
import 'package:flutter_rpg/controllers/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              height: 200,
              child: Image.asset(
                charlesLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
