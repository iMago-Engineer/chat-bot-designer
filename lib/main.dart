import 'package:flutter/material.dart';

import 'src/home_view.dart';
import 'services_locator.dart';
import 'src/services/navigation.dart';

Future<void> main() async {
  await setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'チャットボットデザインナー',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: servicesLocator<NavigationService>().navigatorKey,
      home: const HomeView(),
    );
  }
}
