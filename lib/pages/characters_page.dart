import 'package:flutter/material.dart';
import 'package:flutter_rpg/components/custom_app_scroll.dart';
import 'package:flutter_rpg/components/gradient_button.dart';
import 'package:flutter_rpg/components/loading_overlay.dart';
import 'package:flutter_rpg/controllers/characters_controller.dart';
import 'package:flutter_rpg/routes/app_route_generator.dart';
import 'package:flutter_rpg/utils/functions.dart';
import 'package:get/get.dart';

class CharactersPage extends GetView<CharactersController> {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> list = [
      'Personagem A',
      'Personagem B',
      'Personagem C',
      'Personagem D',
    ];

    return SafeArea(
      child: Scaffold(
        body: LoadingOverlay(
          child: Obx(() {
            return CustomAppScroll(
              scrollController: controller.scrollController,
              offset: controller.offset.value,
              title: 'characters.page.title'.tr,
              widgets: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: list.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: Get.width / (Get.height / 1.3),
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: GradientButton(
                                      title: 'Criar',
                                      fontSize: 13,
                                      callback: () => {},
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () => navigateOff(AppRoutes.login),
                            child: const Center(
                              child: Text('Sair'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
