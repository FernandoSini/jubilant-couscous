import 'package:flutter/material.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_routes.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/base/web_base_screen.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/error/web_error_screen.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/home/home_screen.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/login/web_login_screen.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/splash/splash_web.dart';

class WebPages {
  static Route? routes(RouteSettings? settings) {
    final args = settings?.arguments;

    switch (settings?.name) {
      case WebRoutes.base:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation1, animation2) =>
                const WebBaseScreen());
      case WebRoutes.home:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation1, animation2) => WebHome(
                  argument: settings!.arguments,
                ));
      case WebRoutes.splash:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation1, animation2) => const SplashWeb(),
        );
      case WebRoutes.login:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation1, animation2) =>
                const WebLoginScreen());
      //default:
      /*  return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation1, animation2) =>
                const WebErrorScreen()); */
    }
  }

  /* Map<String, Widget Function(BuildContext)> myRoutes = {
    WebRoutes.splash: (BuildContext context)=> const SplashWeb(),
    WebRoutes.home: (BuildContext context)=> const WebHome(),
    WebRoutes.base: (BuildContext context)=> const WebBaseScreen(),
    WebRoutes.error: (BuildContext context)=> const WebErrorScreen()
  }; */
}
