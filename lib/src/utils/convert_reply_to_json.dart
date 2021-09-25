import 'dart:convert';

import '../models/choice.dart';
import '../models/reply.dart';

String convertReplyMapToJson(Map<Reply, Map<String, Reply>> replyMap) {
  Map<String, dynamic> content = {};

  final firstReply = replyMap.keys.first;
  content['start'] = _createOnePart(firstReply);

  for (final entry in replyMap.entries) {
    for (final choice in entry.key.choices) {
      // User が返信できる時にだけ生成する
      if (entry.value.containsKey(choice.text)) {
        final partialContent = _createOnePart(entry.value[choice.text]);

        // User が送ってきたものに対する返信が定義されている時だけ生成する
        if (partialContent != null) {
          final title = entry.key.title ?? '';

          content['$title[${choice.text}]'] = partialContent;
        }
      }
    }
  }

  content['None'] = [
    {
      'type': 'text',
      'text': 'それに答えることができません',
    },
  ];

  return json.encode(content);
}

// 1つの塊
List<Map<String, dynamic>>? _createOnePart(Reply? reply) {
  if (reply == null) return null;

  switch (reply.type) {
    case ReplyType.template:
      if (reply.choices.isEmpty) return null;

      final title = (reply.title == null || reply.title!.isEmpty)
          ? reply.text
          : reply.title;

      return [
        {
          'type': 'template',
          'altText': 'this is a button template',
          'template': {
            'type': 'buttons',
            'title': title,
            'text': reply.text,
            'actions': _createActionPart(reply),
          },
        }
      ];
    case ReplyType.text:
      if (reply.text.isEmpty) return null;
      return [
        {
          'type': 'text',
          'text': reply.text,
        }
      ];
    default:
      return null;
  }
}

List<dynamic> _createActionPart(Reply reply) {
  final formattedTitle = reply.title ?? '';

  return reply.choices.map((Choice choice) {
    return {
      'type': 'message',
      'label': choice.text,
      'text': '$formattedTitle[${choice.text}]'
    };
  }).toList();
}
