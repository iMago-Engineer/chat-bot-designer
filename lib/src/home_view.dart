import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../services_locator.dart';
import 'create_reply_dialog.dart';
import 'services/navigation.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('チャットボットデザインナー')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newReplyOrNull = await showDialog(
            context: servicesLocator<NavigationService>().currentContext!,
            builder: (context) => const CreateReplyDialog(),
          );

          if (newReplyOrNull == null) {
            print('null');
          } else {
            print(newReplyOrNull);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
