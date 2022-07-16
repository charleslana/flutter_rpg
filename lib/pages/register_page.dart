import 'package:flutter/material.dart';
import 'package:flutter_rpg/components/card_form.dart';
import 'package:flutter_rpg/components/custom_app_scroll.dart';
import 'package:flutter_rpg/components/custom_container.dart';
import 'package:flutter_rpg/components/gradient_button.dart';
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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 20),
                          CardForm(
                            widget: Form(
                              key: controller.registerFormKey,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      controller: controller.emailController,
                                      decoration: InputDecoration(
                                          labelText: 'register.page.email'.tr),
                                      validator: (String? value) => controller
                                          .validator(value, isValidEmail: true),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: controller.passwordController,
                                      decoration: InputDecoration(
                                          labelText:
                                              'register.page.password'.tr),
                                      validator: (String? value) =>
                                          controller.validator(value,
                                              isPasswordConfirmation: true),
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: controller
                                          .passwordConfirmationController,
                                      decoration: InputDecoration(
                                          labelText:
                                              'register.page.password.confirmartion'
                                                  .tr),
                                      validator: (String? value) =>
                                          controller.validator(value,
                                              isPasswordConfirmation: true),
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 20),
                                    GradientButton(
                                      title: 'register.page.button'.tr,
                                      callback: controller.register,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          RichText(
                            text: TextSpan(
                              text: 'register.page.service.terms.text'.tr,
                              children: [
                                TextSpan(
                                  text: 'register.page.service.terms.action'.tr,
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Dosis',
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
