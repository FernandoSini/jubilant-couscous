import 'package:flutter/material.dart';
import 'package:jubilant_couscous/mobile/app/data/routes/mobile_routes.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/base/mobile_base_screen.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/error/mobile_error_screen.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/home/mobile_home_screen.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/login/mobile_login_screen.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/splash/splash_mobile.dart';

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
      case MobileRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashMobile(),
          settings: settings,
        );

      default:

      /* return MaterialPageRoute(
            builder: (context) => const MobileErrorScreen(), settings: settings);
     */
    }
  }
  Map<String, Widget Function(BuildContext)> myRoutes = {
    MobileRoutes.splash: (BuildContext context)=> const SplashMobile(),
    MobileRoutes.home: (BuildContext context)=> const MobileHome(),
    MobileRoutes.base: (BuildContext context)=> const MobileBaseScreen(),
    MobileRoutes.error: (BuildContext context)=> const MobileErrorScreen()
  };
}
