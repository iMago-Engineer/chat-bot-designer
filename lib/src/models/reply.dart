import 'choice.dart';

class Reply {
  final int id;
  final int? parentId;
  final ReplyType type;
  final String text;
  final String? title;
  final List<Choice>? choices;

  Reply({
    required this.id,
    required this.type,
    required this.text,
    this.parentId,
    this.title,
    this.choices,
  });

  @override
  String toString() {
    return '''
    Reply: {
      id: $id,
      parentId: $parentId,
      type: $type,
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
