import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes{

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(route: 'Driver', icon: Icons.app_shortcut_rounded, name: 'Driver', screen: const DriverScreen()),
    MenuOption(route: 'Team', icon: Icons.list_alt_rounded, name: 'Team', screen: const TeamScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute (RouteSettings settings) {
    return  MaterialPageRoute(
        builder: (context) => const HomeScreen()
    );
  }
}