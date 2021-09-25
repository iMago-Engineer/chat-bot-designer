import 'package:chat_bot_designer/src/models/reply.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<List<Reply>> replies = [[]];

  void addReply({required int rowIndex, required Reply newReply}) {
    replies[rowIndex].add(newReply);

    notifyListeners();
  }
}
