import 'package:flutter/material.dart';
import 'package:flutter_rpg/components/custom_app_scroll.dart';
import 'package:flutter_rpg/constants/image_constant.dart';
import 'package:flutter_rpg/controllers/form_login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FormLoginController fx = Get.find<FormLoginController>();

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
                              children: [
                                Obx(
                                  () {
                                    print(
                                        'rebuild TextFormField ${fx.errorText.value}');
                                    return TextFormField(
                                      onChanged:
                                          fx.usernameChanged, // controller func
                                      decoration: InputDecoration(
                                          labelText: 'Username',
                                          errorText: fx.errorText.value // obs
                                          ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20),
                                Obx(
                                  () => ElevatedButton(
                                    onPressed: fx.submitFunc.value,
                                    child: const Text('Submit'), // obs
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
