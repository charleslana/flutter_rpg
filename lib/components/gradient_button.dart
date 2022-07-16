import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.title,
    this.callback,
    this.fontSize,
  }) : super(key: key);

  final String title;
  final double? fontSize;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color.fromARGB(255, 133, 90, 150), Colors.deepPurple],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
