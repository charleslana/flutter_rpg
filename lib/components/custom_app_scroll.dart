import 'package:flutter/material.dart';
import 'package:flutter_rpg/controllers/language_controller.dart';
import 'package:flutter_rpg/controllers/sliver_app_bar_controller.dart';
import 'package:get/get.dart';

class CustomAppScroll extends StatelessWidget {
  const CustomAppScroll({
    Key? key,
    required this.title,
    required this.widgets,
    this.isBackArrow = false,
    this.actions,
  }) : super(key: key);

  final String title;
  final List<Widget> widgets;
  final bool isBackArrow;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController =
        Get.find<LanguageController>();
    final SliverAppBarController sliverAppBarController =
        Get.find<SliverAppBarController>();

    return CustomScrollView(
      controller: sliverAppBarController.scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        Obx(() {
          return SliverAppBar(
            backgroundColor: sliverAppBarController.isTransparent.value
                ? Colors.transparent
                : null,
            expandedHeight: 56,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(title.tr),
              centerTitle: true,
            ),
            pinned: true,
            elevation: 0,
            leading: isBackArrow
                ? IconButton(
                    onPressed: Get.back<dynamic>,
                    icon: const Icon(Icons.arrow_back_ios_new),
                  )
                : null,
            actions: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: languageController.selectedLanguage.value,
                  items: languageController.languages
                      .map(
                        (item) => DropdownMenuItem(
                          value: item.language,
                          child: Text(item.language),
                        ),
                      )
                      .toList(),
                  onChanged: (String? value) =>
                      languageController.changeLanguage(value!),
                ),
              ),
            ],
          );
        }),
        SliverList(
          delegate: SliverChildListDelegate(widgets),
        ),
      ],
    );
  }
}
