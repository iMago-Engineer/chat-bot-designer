import 'package:chat_bot_designer/src/models/draft_reply.dart';
import 'package:chat_bot_designer/src/models/reply.dart';
import 'package:chat_bot_designer/src/utils/convert_reply_to_json.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<Reply> replies = [Reply(id: 0, type: ReplyType.template, text: '')];

  // TODO: repliesInListToMap
  Map<Reply, Map<String, Reply>> test = {};
  get jsonReply => turnToJson(test);

  void addReply(DraftReply draftReply, int parentId) {
    final newReply = Reply(
      id: replies.length,
      parentId: parentId,
      type: draftReply.type,
      title: draftReply.title,
      text: draftReply.text,
      choices: draftReply.choices,
    );

    replies.add(newReply);

    notifyListeners();
  }
}
