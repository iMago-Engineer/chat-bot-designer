import '../models/reply.dart';

Map<Reply, Map<String, Reply>> repliesListToMap(List<Reply> replies) {
  return replies.fold({},
      (Map<Reply, Map<String, Reply>> repliesMap, Reply currentReply) {
    final children = replies
        .where((Reply childReply) => childReply.parentId == currentReply.id)
        .toList();

    Map<String, Reply> childMap = {};
    for (int i = 0; i < children.length; i++) {
      final childReply = children[i];
      childMap[currentReply.choices[i].text] = childReply;
    }

    currentReply.type =
        (children.isEmpty) ? ReplyType.text : ReplyType.template;
    repliesMap[currentReply] = childMap;

    return repliesMap;
  });
}
