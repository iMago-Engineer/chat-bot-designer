import 'package:chat_bot_designer/src/models/reply.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<List<Reply>> replies = [
    [Reply(type: ReplyType.template, text: 'hello')]
  ];
}
