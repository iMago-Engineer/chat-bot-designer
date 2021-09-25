import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final appTheme = ThemeData(
        primaryColor: const Color(0xff06C755),
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme));
    return MaterialApp(
      title: 'LINE Chat Bot Designer',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      navigatorKey: servicesLocator<NavigationService>().navigatorKey,
      home: const HomeView(),
    );
  }
}
