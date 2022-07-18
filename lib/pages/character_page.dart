import 'package:flutter/material.dart';
import 'package:flutter_rpg/components/custom_app_scroll.dart';
import 'package:flutter_rpg/components/gradient_button.dart';
import 'package:flutter_rpg/components/loading_overlay.dart';
import 'package:flutter_rpg/constants/image_constant.dart';
import 'package:flutter_rpg/controllers/character_controller.dart';
import 'package:flutter_rpg/utils/functions.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CharacterPage extends GetView<CharacterController> {
  const CharacterPage({Key? key}) : super(key: key);

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
                            clipBehavior: Clip.none,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: list.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.65,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        ShaderMask(
                                          shaderCallback: (rect) {
                                            return LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.black,
                                                Colors.black.withOpacity(0.8),
                                                Colors.transparent
                                              ],
                                            ).createShader(
                                              Rect.fromLTRB(
                                                0,
                                                0,
                                                rect.width,
                                                rect.height,
                                              ),
                                            );
                                          },
                                          blendMode: BlendMode.dstIn,
                                          child: Image.asset(
                                            getMaleAvatar('18'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => print('clicked'),
                                          icon: const Icon(Icons.delete),
                                        ),
                                        Positioned(
                                          top: -25,
                                          right: -25,
                                          child: SizedBox(
                                            height: 50,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black45
                                                        .withOpacity(0.5),
                                                    BlendMode.srcATop,
                                                  ),
                                                  child:
                                                      Image.asset(earthElement),
                                                ),
                                                const Text(
                                                  '1',
                                                  style:
                                                      TextStyle(fontSize: 17),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Text('teste'),
                                              const SizedBox(height: 5),
                                              SizedBox(
                                                width: double.infinity,
                                                child: LinearPercentIndicator(
                                                  barRadius:
                                                      const Radius.circular(50),
                                                  lineHeight: 14,
                                                  percent: 0.9,
                                                  backgroundColor:
                                                      const Color(0xff26143f),
                                                  progressColor:
                                                      Colors.redAccent,
                                                  center: const Text(
                                                    '300/300',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 7),
                                              GradientButton(
                                                title: 'Jogar',
                                                fontSize: 13,
                                                callback: () => {},
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
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
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          const InkWell(
                            onTap: logout,
                            child: Center(
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
