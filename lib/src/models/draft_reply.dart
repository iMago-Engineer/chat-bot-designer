import 'package:chat_bot_designer/src/models/choice.dart';
import 'package:chat_bot_designer/src/models/reply.dart';

class DraftReply {
  final ReplyType type;
  final String? title;
  final String text;
  final List<Choice>? choices;

  DraftReply({
    required this.type,
    required this.title,
    required this.text,
    required this.choices,
  });

  @override
  String toString() {
    return '''
    DraftReply: {
      type: $type,
      title: $title,
      text: $text,
      choices: $choices,
    }
    ''';
  }
}
