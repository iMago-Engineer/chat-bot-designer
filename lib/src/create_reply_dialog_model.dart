import 'package:chat_bot_designer/src/models/draft_reply.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'models/choice.dart';
import 'models/reply.dart';
import '../services_locator.dart';
import 'services/navigation.dart';
import 'services/snackbar.dart';

class CreateReplyDialogModel extends BaseViewModel {
  // ReplyType type = ReplyType.text;
  String title = '';
  String text = '';
  List<Choice> choices = [];

  ReplyType get type => choices.isEmpty ? ReplyType.text : ReplyType.template;

  bool get showTitleInput => type == ReplyType.template;

  final titleInputController = TextEditingController();
  void setTitle(String newTitle) {
    title = newTitle;
  }

  final textInputController = TextEditingController();
  void setText(String newText) {
    text = newText;
  }

  final actionInputController = TextEditingController();
  void addAction(String newActionText) {
    if (newActionText.isEmpty) return;

    final newAction = Choice(text: newActionText);

    choices.add(newAction);

    actionInputController.clear();

    notifyListeners();
  }

  void deleteAction(Choice action) {
    choices.remove(action);

    notifyListeners();
  }

  void cancel() {
    servicesLocator<NavigationService>().pop();
  }

  bool textReplyIsNotOk() {
    if (type != ReplyType.text) return false;

    return text.isEmpty;
  }

  bool templateReplyIsNotOk() {
    if (type != ReplyType.template) return false;

    return title.isEmpty || text.isEmpty || choices.isEmpty;
  }

  void createNewReply() {
    if (textReplyIsNotOk()) {
      SnackbarService.showSnackbarWithErrorMessage('本文が必要ですよ');

      return;
    }

    if (templateReplyIsNotOk()) {
      SnackbarService.showSnackbarWithErrorMessage('タイトル、本文、選択肢が必要ですよ');

      return;
    }

    servicesLocator<NavigationService>().pop(
      DraftReply(
        type: type,
        title: title,
        text: text,
        choices: choices,
      ),
    );
  }
}
