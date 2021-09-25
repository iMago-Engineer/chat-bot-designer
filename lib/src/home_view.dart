import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'acount.dart';
import 'chat_flow_chart.dart';
import 'header.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: Column(
          children: [
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
          ],
        ),
      ),
    );
  }
}
