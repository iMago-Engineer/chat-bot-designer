import 'package:chat_bot_designer/services_locator.dart';
import 'package:chat_bot_designer/src/create_reply_dialog.dart';
import 'package:chat_bot_designer/src/home_view.dart';
import 'package:chat_bot_designer/src/home_view_model.dart';
import 'package:chat_bot_designer/src/models/reply.dart';
import 'package:chat_bot_designer/src/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ReplyRow extends ViewModelWidget<HomeViewModel> {
  final int rowIndex;

  const ReplyRow({Key? key, required this.rowIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    print(viewModel.replies[rowIndex]);

    final currentRow = viewModel.replies[rowIndex];
    final replyBoxes = currentRow
        .map<Widget>((Reply reply) => ReplyBox(reply: reply))
        .toList();
    replyBoxes.add(ReplyBoxWithPlus(rowIndex: rowIndex));

    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: replyBoxes,
      ),
    );
  }
}

class ReplyBox extends StatelessWidget {
  final Reply reply;

  const ReplyBox({Key? key, required this.reply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 80,
      width: 80,
      child: Align(
        alignment: Alignment.center,
        child: Text(reply.text),
      ),
    );
  }
}

class ReplyBoxWithPlus extends ViewModelWidget<HomeViewModel> {
  final int rowIndex;

  const ReplyBoxWithPlus({Key? key, required this.rowIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      color: Theme.of(context).primaryColor,
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
            viewModel.addReply(rowIndex: rowIndex, newReply: newReplyOrNull);
          }
        },
        icon: const Icon(Icons.add_circle_outline),
      ),
    );
  }
}
