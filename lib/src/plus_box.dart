import 'package:chat_bot_designer/services_locator.dart';
import 'package:chat_bot_designer/src/create_reply_dialog.dart';
import 'package:chat_bot_designer/src/home_view_model.dart';
import 'package:chat_bot_designer/src/models/draft_reply.dart';
import 'package:chat_bot_designer/src/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PlusBox extends ViewModelWidget<HomeViewModel> {
  final int parentId;
  final double maxWidth;

  const PlusBox({
    Key? key,
    required this.parentId,
    required this.maxWidth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      height: 24,
      margin: const EdgeInsets.symmetric(vertical: 2),
      color: Colors.greenAccent,
      child: Align(
        alignment: Alignment.center,
        child: IconButton(
          icon: const Icon(Icons.add_circle_outline),
          iconSize: 30,
          color: Colors.white,
          onPressed: () async {
            final userInput = await showDialog<DraftReply?>(
              context: servicesLocator<NavigationService>().currentContext!,
              builder: (context) => const CreateReplyDialog(),
            );

            if (userInput != null) {
              viewModel.addReply(userInput, parentId);
            }
          },
        ),
      ),
    );
  }
}
