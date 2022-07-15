import 'package:flutter/material.dart';
import 'package:flutter_rpg/controllers/language_controller.dart';
import 'package:flutter_rpg/i18n/app_translation.dart';
import 'package:flutter_rpg/models/language_model.dart';
import 'package:get/get.dart';

class CustomAppScroll extends StatelessWidget {
  const CustomAppScroll({
    Key? key,
    required this.title,
    required this.widgets,
    required this.scrollController,
    this.isBackArrow = false,
    this.offset = 0,
    this.actions,
  }) : super(key: key);

  final String title;
  final List<Widget> widgets;
  final ScrollController scrollController;
  final bool isBackArrow;
  final double offset;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController =
        Get.find<LanguageController>();

    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: offset < 56 ? Colors.transparent : null,
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
              child: DropdownButton<LanguageModel>(
                value: languageController.selectedLanguage.value,
                items: AppTranslation.languages
                    .map(
                      (item) => DropdownMenuItem<LanguageModel>(
                        value: item,
                        child: Text(item.language),
                      ),
                    )
                    .toList(),
                onChanged: (LanguageModel? languageModel) =>
                    languageController.changeLanguage(languageModel!),
              ),
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(widgets),
        ),
      ],
    );
  }
}
