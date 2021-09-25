import 'package:chat_bot_designer/src/chat_flow_chart.dart';
import 'package:chat_bot_designer/src/header.dart';
import 'package:chat_bot_designer/src/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'acount.dart';

// import 'utils/create_python_script.dart';
// import 'utils/download_script.dart'

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
          body: Column(children: [
        const Header(),
        Row(
          children: [
            const Acount(),
            ChatFlowChart(
              currentReply: viewModel.replies.first,
              maxWidth: screenSize.width * 0.75,
            ),
          ],
        )
      ])),
    );
  }
}
