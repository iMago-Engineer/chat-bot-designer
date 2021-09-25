import 'choice.dart';

class Reply {
  final int id;
  final int? parentId;
  final ReplyType type;
  final String trigger;
  final String text;
  final String? title;
  List<Choice> choices;

  Reply({
    required this.id,
    required this.type,
    required this.text,
    required this.trigger,
    this.parentId,
    this.title,
    this.choices = const <Choice>[],
  });

  @override
  String toString() {
    return '''
    Reply: {
      id: $id,
      parentId: $parentId,
      type: $type,
      trigger: $trigger,
      title: $title,
      text: $text,
      choices: $choices,
    }
    ''';
  }
}

enum ReplyType { text, template }

extension ParseToString on ReplyType {
  String toShortString() => toString().split('.').last;
}
