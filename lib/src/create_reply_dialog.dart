import 'package:chat_bot_designer/src/margin_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'dialog_templates.dart';
import 'style_library.dart';
import 'create_reply_dialog_model.dart';

class CreateReplyDialog extends StatelessWidget {
  const CreateReplyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ViewModelBuilder<CreateReplyDialogModel>.reactive(
      viewModelBuilder: () => CreateReplyDialogModel(),
      builder: (context, viewModel, child) => DialogWithTwoButtons(
        title: 'メッセージの作成',
        body: Form(
          child: Column(
            children: [
              Column(
                children: [
                  _TriggerInput(screenSize: screenSize),
                  horizontalMargin20(),
                  _TitleInput(screenSize: screenSize),
                  horizontalMargin20(),
                  _TextInput(screenSize: screenSize),
                ],
              ),
            ],
          ),
        ),
        leftButton: const _CancelButton(),
        rightButton: const _CreateButton(),
      ),
    );
  }
}

class _TriggerInput extends ViewModelWidget<CreateReplyDialogModel> {
  const _TriggerInput({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context, CreateReplyDialogModel viewModel) {
    return Container(
      constraints: BoxConstraints(maxWidth: screenSize.width * 0.4),
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        controller: viewModel.triggerInputController,
        onChanged: viewModel.setTrigger,
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide()),
            contentPadding: formPadding,
            labelText: '* トリガーとなるメッセージ',
            floatingLabelStyle:
                TextStyle(color: Theme.of(context).primaryColor),
            hintText: 'トリガーメッセージが送られてきた時に返信する',
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      ),
    );
  }
}

class _TitleInput extends ViewModelWidget<CreateReplyDialogModel> {
  const _TitleInput({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context, CreateReplyDialogModel viewModel) {
    return Container(
      constraints: BoxConstraints(maxWidth: screenSize.width * 0.4),
      child: TextFormField(
        controller: viewModel.titleInputController,
        cursorColor: Theme.of(context).primaryColor,
        onChanged: viewModel.setTitle,
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide()),
            contentPadding: formPadding,
            labelText: '見出し',
            floatingLabelStyle:
                TextStyle(color: Theme.of(context).primaryColor),
            hintText: '',
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      ),
    );
  }
}

class _TextInput extends ViewModelWidget<CreateReplyDialogModel> {
  const _TextInput({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context, CreateReplyDialogModel viewModel) {
    return Container(
      constraints: BoxConstraints(maxWidth: screenSize.width * 0.4),
      child: TextFormField(
        controller: viewModel.textInputController,
        cursorColor: Theme.of(context).primaryColor,
        minLines: 1,
        maxLines: 10,
        onChanged: viewModel.setText,
        decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide()),
            contentPadding: formPadding,
            labelText: '* メッセージ',
            floatingLabelStyle:
                TextStyle(color: Theme.of(context).primaryColor),
            hintText: '',
            hintStyle: const TextStyle(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      ),
    );
  }
}

class _CancelButton extends ViewModelWidget<CreateReplyDialogModel> {
  const _CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateReplyDialogModel viewModel) {
    return OutlinedButton(
      onPressed: viewModel.cancel,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'キャンセル',
          style: TextStyle(fontSize: 16),
        ),
      ),
      style: outlinedButtonStyle(
          primaryColor: Colors.black,
          shape: const StadiumBorder(),
          minWidth: 150),
    );
  }
}

class _CreateButton extends ViewModelWidget<CreateReplyDialogModel> {
  const _CreateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateReplyDialogModel viewModel) {
    return OutlinedButton(
      onPressed: viewModel.createNewReply,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '確定',
          style: TextStyle(fontSize: 16),
        ),
      ),
      style: outlinedButtonStyle(
          primaryColor: Colors.white,
          backgroundColor: Theme.of(context).primaryColor,
          shape: const StadiumBorder(),
          minWidth: 150),
    );
  }
}
