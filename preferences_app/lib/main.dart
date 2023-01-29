import 'package:flutter/material.dart';

import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/shared/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => const HomeScreen(),
        SettingsScreen.routerName: (_) => const SettingsScreen()
      },
      title: 'Material App',
    );
  }
}
