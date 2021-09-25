import 'choice.dart';

class Reply {
  final ReplyType type;
  final String text;
  String? title;
  List<Choice>? choices;

  Reply({
    required this.type,
    required this.text,
    this.title,
    this.choices,
  });

  @override
  String toString() {
    return '''
    Reply: {
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
