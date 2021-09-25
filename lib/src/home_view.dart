import 'package:chat_bot_designer/src/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'reply_row.dart';
import 'utils/create_python_script.dart';
import 'utils/download_script.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(title: const Text('チャットボットデザインナー'), actions: <Widget>[
          ElevatedButton(
            child: const Text("ダウンロード"),
            onPressed: () {
              // TODO: create here!
              String replyMessage =
                  '{ "None": [{"type": "text","text": "メニューから選択してください。"},], }';
              String script = createPythonScript(replyMessage);
              downloadFile(script);
            },
          )
        ]),
        body: Center(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, rowIndex) {
              return ReplyRow(rowIndex: rowIndex);
            },
          ),
        ),
      ),
    );
  }
}
