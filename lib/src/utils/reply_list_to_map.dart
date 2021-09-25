import 'package:chat_bot_designer/src/models/reply.dart';

Map<Reply, Map<String, Reply>> repliesListToMap(List<Reply> replies) {
  return replies.fold({},
      (Map<Reply, Map<String, Reply>> repliesMap, Reply currentReply) {
    final children = replies
        .where((Reply childReply) => childReply.parentId == currentReply.id)
        .toList();

    Map<String, Reply> childMap = {};
    for (int i = 0; i < children.length; i++) {
      final childReply = children[i];
      childMap[childReply.id.toString()] = childReply;
    }

    repliesMap[currentReply] = childMap;

    return repliesMap;
  });
}
