import 'package:flutter/material.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_routes.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/base/web_base_screen.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/error/web_error_screen.dart';

class WebPages {
  static Route? routes(RouteSettings? settings) {
    final args = settings?.arguments;
    switch (settings?.name) {
      case WebRoutes.base:
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation1, animation2) =>
                const WebBaseScreen());

      default:
      /*  return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation1, animation2) =>
                const WebErrorScreen()); */
    }
  }
}
