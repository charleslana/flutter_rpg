import 'package:flutter/material.dart';
import 'package:flutter_rpg/controllers/loading_overlay_controller.dart';
import 'package:get/get.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final LoadingOverlayController loadingOverlayController =
        Get.find<LoadingOverlayController>();

    return Obx(() {
      return Stack(
        children: [
          child,
          if (loadingOverlayController.isLoading.value)
            WillPopScope(
              onWillPop: () async => false,
              child: const Opacity(
                opacity: 0.2,
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.black,
                ),
              ),
            ),
          if (loadingOverlayController.isLoading.value)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      );
    });
  }
}
