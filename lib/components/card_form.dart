import 'package:flutter/material.dart';

class CardForm extends StatelessWidget {
  const CardForm({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: widget,
    );
  }
}
