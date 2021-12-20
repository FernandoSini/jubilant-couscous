import 'package:flutter/material.dart';
import 'package:jubilant_couscous/mobile/app/data/routes/mobile_routes.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/base/mobile_base_screen.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/error/mobile_error_screen.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/login/mobile_login_screen.dart';

class MobilePages {
  static Route? route(RouteSettings? settings) {
    final args = settings?.arguments;

    switch (settings?.name) {
      case MobileRoutes.base:
        return MaterialPageRoute(
            builder: (context) => const MobileBaseScreen(), settings: settings);

      case MobileRoutes.home:
        return MaterialPageRoute(
            builder: (context) => const MobileBaseScreen(), settings: settings);

      case MobileRoutes.login:
        return MaterialPageRoute(
            builder: (context) => const MobileLoginScreen(),
            settings: settings);

      default:
      /* return MaterialPageRoute(
            builder: (context) => const MobileErrorScreen(), settings: settings);
     */
    }
  }
}
