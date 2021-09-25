import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'reply_row.dart';
import 'utils/create_python_script.dart';
import 'utils/download_script.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('チャットボットデザインナー'), actions: <Widget>[
        ElevatedButton(
          child: Text("ダウンロード"),
          onPressed: () {
            String script = createPythonScript();
            downloadFile(script);
          },
        )
      ]),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, _) => const ReplyRow(),
        ),
      ),
    );
  }
}
