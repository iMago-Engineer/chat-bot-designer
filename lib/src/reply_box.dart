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
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: Colors.blueAccent,
      child: Align(
        alignment: Alignment.center,
        child: Text(reply.text),
      ),
    );
  }
}
