import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {

  static const initialRoute = '/home';

  static final menuOptions = <MenuOption> {
    MenuOption(icon: Icons.add_alarm_outlined, name: 'Alertas - Alerts', route: '/alert', screen: const AlertScreen()),
    MenuOption(icon: Icons.credit_card, name: 'Tarjetas - Cards', route: '/cards', screen: const CardScreen()),
    MenuOption(icon: Icons.home_max_sharp, name: 'Home Screen', route: '/home', screen: const HomeScreen()),
    MenuOption(icon: Icons.list_alt, name: 'Listview tipo 1', route: '/listview1', screen: const Listview1Screen()),
    MenuOption(icon: Icons.list, name: 'Listview tipo 2', route: '/listview2', screen: const Listview2Screen()),
  };

  static Map<String, Widget Function(BuildContext)> routes = {
    '/alert': (BuildContext context) => const AlertScreen(),
    '/card': (BuildContext context) => const CardScreen(),
    '/home': (BuildContext context) => const HomeScreen(),
    '/listview1': (BuildContext context) => const Listview1Screen(),
    '/listview2': (BuildContext context) => const Listview2Screen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) => MaterialPageRoute(builder: (context) => const AlertScreen());

}