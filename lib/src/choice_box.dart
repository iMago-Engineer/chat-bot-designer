import 'package:chat_bot_designer/src/models/choice.dart';
import 'package:flutter/material.dart';

class ChoiceBox extends StatelessWidget {
  final Choice choice;
  final double maxWidth;

  const ChoiceBox({
    Key? key,
    required this.choice,
    required this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: Text(choice.text),
      ),
    );
  }
}
