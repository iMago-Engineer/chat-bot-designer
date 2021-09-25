import 'package:stacked/stacked.dart';

import 'models/choice.dart';
import 'models/draft_reply.dart';
import 'models/reply.dart';
import 'utils/convert_reply_to_json.dart';
import 'utils/create_python_script.dart';
import 'utils/download_script.dart';
import 'utils/reply_list_to_map.dart';

class HomeViewModel extends BaseViewModel {
  List<Reply> replies = [
    Reply(
      id: 0,
      type: ReplyType.template,
      trigger: '0',
      text: '0',
      choices: [],
    )
  ];

  void addReply(DraftReply draftReply, int parentId) {
    // 自分のトリガーを、親の choice に追加する
    final parentReply =
        replies.where((element) => element.id == parentId).first;
    parentReply.choices.add(Choice(text: draftReply.trigger));

    // 自分を replies のリストに追加する
    final newReply = Reply(
      id: replies.length,
      parentId: parentId,
      type: draftReply.type,
      trigger: draftReply.trigger,
      title: draftReply.title,
      text: draftReply.text,
      choices: [],
    );
    replies.add(newReply);

    notifyListeners();
  }

  void downloadChatFlowChart() {
    final replyMap = repliesListToMap(replies);
    final replyMessage = convertReplyMapToJson(replyMap);
    String pythonScript = createPythonScript(replyMessage);
    downloadFile(pythonScript);
  }
}
