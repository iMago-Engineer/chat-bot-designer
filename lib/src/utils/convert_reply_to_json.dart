import 'package:chat_bot_designer/src/models/choice.dart';

import '../models/reply.dart';

String convertReplyMapToJson(Map<Reply, Map<String, Reply>> edges) {
  // algorithm
  Map<String, dynamic> content = {};
  content["start"] = _createOnePart(edges.keys.first, edges.keys.first.choices);
  for (var edge in edges.entries) {
    edge.key.choices.forEach((action) {
      content["${edge.key.title}[${action.text}]"] = _createOnePart(
          edge.value[action.text], edge.value[action.text]?.choices);
    });
  }

  return content.toString();
}

// 1つの塊
List<Map<String, dynamic>>? _createOnePart(
  Reply? reply,
  List<Choice>? actions,
) {
  if (reply == null) return null;

  if (reply.type == ReplyType.template && actions == null) return null;

  if (reply.type == ReplyType.text && reply.text.isEmpty) return null;

  if (reply.type == ReplyType.template) {
    return [
      {
        "type": "template",
        "altText": "this is a buttons template",
        "template": {
          "type": "buttons",
          "title": reply.title,
          "text": reply.text,
          "actions": _createActionPart(reply.title, actions!)
        }
      }
    ];
  } else if (reply.type == ReplyType.text) {
    return [
      {"type": "text", "text": reply.text}
    ];
  }
}

List<dynamic> _createActionPart(String? title, List<Choice> actions) {
  final formattedTitle = title ?? '';

  List<dynamic> choices = [];
  for (var action in actions) {
    choices.add({
      "type": "message",
      "label": action.text,
      "text": "$formattedTitle[${action.text}]"
    });
  }
  return choices;
}
