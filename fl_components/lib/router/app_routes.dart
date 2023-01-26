import 'package:flutter/material.dart';

import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {

  static const initialRoute = '/home';

  static final menuOptions = <MenuOption> {
    MenuOption(icon: Icons.add_alarm_outlined, name: 'Alertas - Alerts', route: '/alert', screen: const AlertScreen()),
    MenuOption(icon: Icons.play_circle_outline_rounded, name: 'Animated Container', route: '/animated', screen: const AnimatedScreen()),
    MenuOption(icon: Icons.supervised_user_circle_outlined, name: 'Circle Avatar', route: '/avatar', screen: const AvatarScreen()),
    MenuOption(icon: Icons.credit_card, name: 'Tarjetas - Cards', route: '/cards', screen: const CardScreen()),
    MenuOption(icon: Icons.input_rounded, name: 'Text Inputs', route: '/inputs', screen: const InputsScreen()),
    MenuOption(icon: Icons.build_circle_outlined, name: 'InfiniteScroll & Pull to refresh', route: '/listviewbuilder', screen: const ListviewBuilderScreen()),
    MenuOption(icon: Icons.list_alt, name: 'Listview tipo 1', route: '/listview1', screen: const Listview1Screen()),
    MenuOption(icon: Icons.list, name: 'Listview tipo 2', route: '/listview2', screen: const Listview2Screen()),
    MenuOption(icon: Icons.slow_motion_video_rounded, name: 'Sliders && Checks', route: '/slider', screen: const SliderScreen())
  };

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'/home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) => MaterialPageRoute(builder: (context) => const AlertScreen());

}