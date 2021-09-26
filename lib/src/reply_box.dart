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
    final showTitle = reply.title != null && reply.title!.isNotEmpty;

    return Column(
      children: [
        ChoiceBox(choice: Choice(text: reply.trigger), maxWidth: maxWidth),
        Container(
          constraints: BoxConstraints(
            minWidth: maxWidth,
            maxWidth: maxWidth,
            minHeight: 48,
          ),
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showTitle)
                Text(
                  reply.title!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Text(reply.text, style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}
