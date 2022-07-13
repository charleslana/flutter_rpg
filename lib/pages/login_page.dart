import 'package:flutter/material.dart';
import 'package:flutter_rpg/components/custom_app_scroll.dart';
import 'package:flutter_rpg/components/gradient_button.dart';
import 'package:flutter_rpg/constants/image_constant.dart';
import 'package:flutter_rpg/controllers/form_login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormLoginController formLoginController =
        Get.find<FormLoginController>();

    return SafeArea(
      child: Scaffold(
        body: Container(
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
                  Container(
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
                  ),
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
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Card(
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Obx(
                                  () {
                                    return TextFormField(
                                      onChanged:
                                          formLoginController.usernameChanged,
                                      decoration: InputDecoration(
                                          labelText: 'E-mail',
                                          errorText: formLoginController
                                              .errorText.value),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20),
                                Obx(
                                  () => GradientButton(
                                    title: 'login.page.button',
                                    callback:
                                        formLoginController.submitFunc.value,
                                  ),
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
      ),
    );
  }
}
