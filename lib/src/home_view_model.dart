import 'package:chat_bot_designer/src/models/choice.dart';
import 'package:chat_bot_designer/src/models/draft_reply.dart';
import 'package:chat_bot_designer/src/models/reply.dart';
import 'package:chat_bot_designer/src/utils/convert_reply_to_json.dart';
import 'package:stacked/stacked.dart';

// final testData = [
//   Reply(
//     id: 0,
//     type: ReplyType.template,
//     text: '',
//     choices: [Choice(text: '')],
//   ),
//   Reply(
//     id: 1,
//     parentId: 0,
//     type: ReplyType.template,
//     text: '1',
//     choices: [Choice(text: '1-2'), Choice(text: '1-6')],
//   ),
//   Reply(
//     id: 2,
//     parentId: 1,
//     type: ReplyType.template,
//     text: '2',
//     choices: [Choice(text: '2-3')],
//   ),
//   Reply(
//     id: 3,
//     parentId: 2,
//     type: ReplyType.text,
//     text: '3',
//   ),
//   Reply(
//     id: 4,
//     parentId: 0,
//     type: ReplyType.template,
//     text: '4',
//     choices: [Choice(text: '4-5')],
//   ),
//   Reply(
//     id: 5,
//     parentId: 4,
//     type: ReplyType.template,
//     text: '5',
//     choices: [Choice(text: '5-7')],
//   ),
//   Reply(
//     id: 6,
//     parentId: 1,
//     type: ReplyType.text,
//     text: '6',
//   ),
//   Reply(
//     id: 7,
//     parentId: 5,
//     type: ReplyType.text,
//     text: '7',
//   )
// ];
// var defaultReplies = [
//   Reply(
//     id: 0,
//     type: ReplyType.template,
//     trigger: '',
//     text: '',
//     choices: [],
//   )
// ];

class HomeViewModel extends BaseViewModel {
  List<Reply> replies = [
    Reply(
      id: 0,
      type: ReplyType.template,
      trigger: '',
      text: '',
      choices: [],
    )
  ];

  void addReply(DraftReply draftReply, int parentId) {
    final parentReply =
        replies.where((element) => element.id == parentId).first;
    parentReply.choices.add(Choice(text: draftReply.trigger));

    final newReply = Reply(
      id: replies.length,
      parentId: parentId,
      type: draftReply.type,
      trigger: draftReply.trigger,
      title: draftReply.title,
      text: draftReply.text,
    );

    replies.add(newReply);

    notifyListeners();
  }
}
