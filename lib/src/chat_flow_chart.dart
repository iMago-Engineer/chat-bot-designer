import 'package:chat_bot_designer/src/home_view_model.dart';
import 'package:chat_bot_designer/src/models/reply.dart';
import 'package:chat_bot_designer/src/plus_box.dart';
import 'package:chat_bot_designer/src/reply_box.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:chat_bot_designer/src/style_library.dart';
import 'package:flutter/widgets.dart';
import 'home_view_model.dart';

class ChatFlowChartInContainer extends StatelessWidget {
  final HomeViewModel model;

  const ChatFlowChartInContainer({Key? key, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      width: screenSize.width * 0.70,
      height: screenSize.height - 120,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 10),
      child: ChatFlowChart(
        currentReply: model.replies.first,
        maxWidth: screenSize.width * 0.60,
      ),
    );
  }
}

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
    final childrenReplies = filterChildrenReplies(
      viewModel.replies,
      parentId: currentReply.id,
    );

    final unitWidth = maxWidth / (childrenReplies.length * 4 + 1);

    final childrenWidgets = childrenRepliesWidgets(
      childrenReplies,
      unitWidth * 4,
    );

    childrenWidgets.add(PlusBox(
      parentId: currentReply.id,
      maxWidth: unitWidth,
    ));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrenWidgets,
    );
  }
}
