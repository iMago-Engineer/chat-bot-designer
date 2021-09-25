import 'package:chat_bot_designer/src/models/reply.dart';

class DraftReply {
  final ReplyType type;
  final String? title;
  final String text;
  final String trigger;

  DraftReply({
    required this.trigger,
    required this.type,
    required this.title,
    required this.text,
  });

  @override
  String toString() {
    return '''
    DraftReply: {
      trigger: $trigger,
      type: $type,
      title: $title,
      text: $text,
    }
    ''';
  }
}
