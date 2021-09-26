import 'package:chat_bot_designer/src/models/draft_reply.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'models/reply.dart';
import '../services_locator.dart';
import 'services/navigation.dart';
import 'services/snackbar.dart';

class CreateReplyDialogModel extends BaseViewModel {
  String trigger = '';
  String title = '';
  String text = '';

  final triggerInputController = TextEditingController();
  void setTrigger(String newTrigger) {
    trigger = newTrigger;
  }

  final titleInputController = TextEditingController();
  void setTitle(String newTitle) {
    title = newTitle;
  }

  final textInputController = TextEditingController();
  void setText(String newText) {
    text = newText;
  }

  void cancel() {
    servicesLocator<NavigationService>().pop();
  }

  Future<void> createNewReply() async {
    if (trigger.isEmpty) {
      SnackbarService.showSnackbarWithErrorMessage('「トリガーとなるメッセージ」が必要ですよ');
      return;
    }

    if (text.isEmpty) {
      SnackbarService.showSnackbarWithErrorMessage('「メッセージ」が必要ですよ');
      return;
    }

    final navigationService = servicesLocator<NavigationService>();

    navigationService.pop(
      DraftReply(
        trigger: trigger,
        type: ReplyType.template,
        title: title,
        text: text,
      ),
    );
  }
}
