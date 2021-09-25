import 'package:chat_bot_designer/src/chat_flow_chart.dart';
import 'package:chat_bot_designer/src/home_view_model.dart';
import 'package:chat_bot_designer/src/utils/convert_reply_to_json.dart';
import 'package:chat_bot_designer/src/utils/reply_list_to_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'utils/create_python_script.dart';
import 'utils/download_script.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('チャットボットデザインナー'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("ダウンロード"),
                onPressed: () {
                  // TODO: create here!
                  final replyMap = repliesListToMap(viewModel.replies);
                  print(replyMap);
                  final replyMessage = convertReplyMapToJson(replyMap);
                  print(replyMessage);

                  // String replyMessage =
                  //     '{ "None": [{"type": "text","text": "メニューから選択してください。"},], }';
                  String script = createPythonScript(replyMessage);
                  downloadFile(script);
                },
              )
            ]),
        body: Center(
          child: ChatFlowChart(
            currentReply: viewModel.replies.first,
            maxWidth: screenSize.width,
          ),
        ),
      ),
    );
  }
}
