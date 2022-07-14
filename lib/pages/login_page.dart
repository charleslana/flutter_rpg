import 'package:flutter/material.dart';
import 'package:flutter_rpg/components/custom_app_scroll.dart';
import 'package:flutter_rpg/components/gradient_button.dart';
import 'package:flutter_rpg/components/loading_overlay.dart';
import 'package:flutter_rpg/constants/image_constant.dart';
import 'package:flutter_rpg/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoadingOverlay(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ImageConstant.background),
                colorFilter: ColorFilter.mode(
                  Color.fromRGBO(156, 39, 176, 0.4),
                  BlendMode.overlay,
                ),
              ),
            ),
            child: CustomAppScroll(
              title: 'login.page.title',
              widgets: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 50),
                          Center(
                            child: SizedBox(
                              height: 100,
                              child: Image.asset(
                                ImageConstant.logo,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Card(
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Form(
                              key: controller.loginFormKey,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      controller: controller.emailController,
                                      decoration: InputDecoration(
                                          labelText: 'login.page.email'.tr),
                                      validator: (String? value) => controller
                                          .validator(value, isValidEmail: true),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: controller.passwordController,
                                      decoration: InputDecoration(
                                          labelText: 'login.page.password'.tr),
                                      validator: controller.validator,
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 20),
                                    GradientButton(
                                      title: 'login.page.button',
                                      callback: controller.login,
                                    ),
                                  ],
                                ),
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
        ),
      ),
    );
  }
}
