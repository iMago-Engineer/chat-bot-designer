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
        title: 'どう返信しますか？',
        body: Form(
          child: Column(
            children: [
              Column(
                children: [
                  _TriggerInput(screenSize: screenSize),
                  _TitleInput(screenSize: screenSize),
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
        controller: viewModel.triggerInputController,
        onChanged: viewModel.setTrigger,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide()),
          contentPadding: formPadding,
          labelText: 'どんな返信が来た？ *',
          hintText: 'はい',
          hintStyle: hintTextStyle,
        ),
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
        onChanged: viewModel.setTitle,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide()),
          contentPadding: formPadding,
          labelText: 'タイトル',
          hintText: '挨拶',
          hintStyle: hintTextStyle,
        ),
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
        minLines: 1,
        maxLines: 10,
        onChanged: viewModel.setText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(borderSide: BorderSide()),
          contentPadding: formPadding,
          labelText: '本文 *',
          hintText: 'こんにちは',
          hintStyle: hintTextStyle,
        ),
      ),
    );
  }
}

// class _ActionInput extends ViewModelWidget<CreateReplyDialogModel> {
//   const _ActionInput({
//     Key? key,
//     required this.screenSize,
//   }) : super(key: key);

//   final Size screenSize;

//   @override
//   Widget build(BuildContext context, CreateReplyDialogModel viewModel) {
//     return Container(
//       constraints: BoxConstraints(maxWidth: screenSize.width * 0.4),
//       child: TextFormField(
//         controller: viewModel.actionInputController,
//         onFieldSubmitted: viewModel.addAction,
//         decoration: InputDecoration(
//           border: const OutlineInputBorder(borderSide: BorderSide()),
//           contentPadding: formPadding,
//           labelText: '選択肢',
//           hintText: 'はい',
//           hintStyle: hintTextStyle,
//         ),
//       ),
//     );
//   }
// }

// class _ChoiceChip extends ViewModelWidget<CreateReplyDialogModel> {
//   final Choice choice;

//   const _ChoiceChip({Key? key, required this.choice}) : super(key: key);

//   @override
//   Widget build(BuildContext context, CreateReplyDialogModel viewModel) {
//     return Container(
//       margin: const EdgeInsets.all(4.0),
//       child: Chip(
//         label: Text(choice.text),
//         deleteIcon: const Icon(Icons.close, size: 12),
//         onDeleted: () => viewModel.deleteAction(choice),
//       ),
//     );
//   }
// }

class _CancelButton extends ViewModelWidget<CreateReplyDialogModel> {
  const _CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CreateReplyDialogModel viewModel) {
    return OutlinedButton(
      onPressed: viewModel.cancel,
      child: const Text(
        'キャンセル',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: outlinedButtonStyle(
        primaryColor: Colors.black,
        shape: const StadiumBorder(),
      ),
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
      child: const Text(
        '確定',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: outlinedButtonStyle(
        primaryColor: Theme.of(context).primaryColor,
        shape: const StadiumBorder(),
      ),
    );
  }
}
