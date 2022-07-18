import 'package:flutter/material.dart';
import 'package:flutter_rpg/components/custom_app_scroll.dart';
import 'package:flutter_rpg/components/custom_container.dart';
import 'package:flutter_rpg/constants/image_constant.dart';
import 'package:flutter_rpg/controllers/landing_controller.dart';
import 'package:get/get.dart';

class LandingPage extends GetView<LandingController> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          body: CustomContainer(
            child: CustomAppScroll(
              scrollController: controller.scrollController,
              title: '',
              widgets: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: SizedBox(
                              height: 100,
                              child: Image.asset(
                                logo,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: controller.isLoading.value,
                                    child: Stack(
                                      children: const [
                                        LinearProgressIndicator(),
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    controller.text.value,
                                    style: const TextStyle(fontFamily: 'Lato'),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
