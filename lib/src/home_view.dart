import 'package:chat_bot_designer/src/style_library.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

import 'account.dart';
import 'chat_flow_chart.dart';
import 'header.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: baseColor,
        body: Column(
          children: [
            const Header(),
            Row(
              children: [
                const Account(),
                ChatFlowChartInContainer(model: viewModel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
