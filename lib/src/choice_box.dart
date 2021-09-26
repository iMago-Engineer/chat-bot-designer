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
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(choice.text),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Icon(Icons.arrow_drop_down, color: Colors.black, size: 32),
          ),
        ],
      ),
    );
  }
}
