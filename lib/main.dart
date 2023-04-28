import 'package:edd/Screens/Splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'Components/Repo/Reporepository.dart';

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
    child: MyApp(),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'EDD',
      home: RepositoryProvider(
        create: (context) => DONATIONRepository(),
        child: const Splashscreen(),
      ),

      debugShowCheckedModeBanner: false,
      // loclization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
