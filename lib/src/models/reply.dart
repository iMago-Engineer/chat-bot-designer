import 'action.dart';

class Reply {
  final ReplyType type;
  final String title;
  final String text;
  final List<Action> actions;

  Reply({
    required this.type,
    required this.title,
    required this.text,
    required this.actions,
  });

  @override
  String toString() {
    return '''
    Reply: {
      type: $type,
      title: $title,
      text: $text,
      actions: $actions,
    }
    ''';
  }
}

enum ReplyType { text, template }
