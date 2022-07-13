import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.title,
    this.callback,
  }) : super(key: key);

  final String title;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 133, 90, 150), Colors.deepPurple],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        foregroundDecoration: callback == null
            ? BoxDecoration(
                color: Colors.grey,
                backgroundBlendMode: BlendMode.saturation,
                borderRadius: BorderRadius.circular(25),
              )
            : null,
        child: Center(
          child: Text(
            title.tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
