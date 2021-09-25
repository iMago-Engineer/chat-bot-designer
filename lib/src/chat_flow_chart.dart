import 'package:chat_bot_designer/src/home_view_model.dart';
import 'package:chat_bot_designer/src/models/reply.dart';
import 'package:chat_bot_designer/src/plus_box.dart';
import 'package:chat_bot_designer/src/reply_box.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ChatFlowChart extends ViewModelWidget<HomeViewModel> {
  final Reply currentReply;
  final double maxWidth;

  const ChatFlowChart({
    Key? key,
    required this.currentReply,
    required this.maxWidth,
  }) : super(key: key);

  List<Reply> filterChildrenReplies(List<Reply> replies,
      {required int parentId}) {
    return replies.where((Reply reply) => reply.parentId == parentId).toList();
  }

  List<Widget> childrenRepliesWidgets(List<Reply> replies, double width) {
    return replies.map<Widget>((Reply reply) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ReplyBox(reply: reply, maxWidth: width),
            ChatFlowChart(currentReply: reply, maxWidth: width),
          ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final childrenReplies =
        filterChildrenReplies(viewModel.replies, parentId: currentReply.id);
    final childrenWidth = maxWidth / (childrenReplies.length + 1);

    final childrenWidgets =
        childrenRepliesWidgets(childrenReplies, childrenWidth);
    childrenWidgets.add(PlusBox(
      parentId: currentReply.id,
      maxWidth: childrenWidth,
    ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrenWidgets,
    );
  }
}
