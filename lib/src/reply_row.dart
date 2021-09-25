import 'package:chat_bot_designer/services_locator.dart';
import 'package:chat_bot_designer/src/create_reply_dialog.dart';
import 'package:chat_bot_designer/src/services/navigation.dart';
import 'package:flutter/material.dart';

class ReplyRow extends StatelessWidget {
  const ReplyRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ReplyBox(),
          ReplyBoxWithPlus(),
          ReplyBoxWithPlus(),
          ReplyBoxWithPlus(),
          ReplyBoxWithPlus(),
        ],
      ),
    );
  }
}

class ReplyBox extends StatelessWidget {
  const ReplyBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 80,
      width: 80,
    );
  }
}

class ReplyBoxWithPlus extends StatelessWidget {
  const ReplyBoxWithPlus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 80,
      width: 80,
      child: IconButton(
        iconSize: 30,
        color: Colors.white,
        onPressed: () async {
          final newReplyOrNull = await showDialog(
            context: servicesLocator<NavigationService>().currentContext!,
            builder: (context) => const CreateReplyDialog(),
          );

          if (newReplyOrNull == null) {
            print('null');
          } else {
            print(newReplyOrNull);
          }
        },
        icon: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
