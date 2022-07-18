import 'package:flutter/material.dart';
import 'package:flutter_rpg/constants/image_constant.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(background),
          colorFilter: ColorFilter.mode(
            Color.fromRGBO(156, 39, 176, 0.4),
            BlendMode.overlay,
          ),
        ),
      ),
      child: child,
    );
  }
}
