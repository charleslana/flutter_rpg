import 'package:flutter/material.dart';
import 'package:flutter_rpg/components/custom_app_scroll.dart';
import 'package:flutter_rpg/components/custom_container.dart';
import 'package:flutter_rpg/components/loading_overlay.dart';
import 'package:flutter_rpg/controllers/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoadingOverlay(
          child: CustomContainer(
            child: CustomAppScroll(
              scrollController: controller.scrollController,
              title: 'register.page.title'.tr,
              isBackArrow: true,
              widgets: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: const [
                          SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
