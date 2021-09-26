import 'package:chat_bot_designer/src/choice_box.dart';
import 'package:chat_bot_designer/src/models/choice.dart';
import 'package:chat_bot_designer/src/models/reply.dart';
import 'package:flutter/material.dart';

class ReplyBox extends StatelessWidget {
  final Reply reply;
  final double maxWidth;

  const ReplyBox({
    Key? key,
    required this.reply,
    required this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChoiceBox(choice: Choice(text: reply.trigger), maxWidth: maxWidth),
        Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          height: 48,
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          child: Align(
            alignment: Alignment.center,
            child:
                Text(reply.text, style: const TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
