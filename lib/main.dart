import 'package:edd/Screens/Splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

// void main() {
//   runApp(const MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('am', 'ETH'),
    ],
    path: 'assets/translations',
    saveLocale: true,
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'EDD',
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
      // loclization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
