import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jubilant_couscous/mobile/app/data/routes/mobile_pages.dart';
import 'package:jubilant_couscous/mobile/app/data/routes/mobile_routes.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/base/mobile_base_screen.dart';
import 'package:jubilant_couscous/web/app/data/providers/web_login_provider.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_pages.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_routes.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/base/web_base_screen.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/home/home_screen.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/login/web_login_screen.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/splash/splash_web.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

import 'web/app/data/ui/screens/error/web_error_screen.dart';

final ThemeData darkTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.greenAccent.shade400,
      ),
    ),
    //primaryColor: Colors.greenAccent.shade400,
    primaryColor: Colors.deepOrangeAccent);
final ThemeData defaultTheme = ThemeData(
  //iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: Colors.blue,
  appBarTheme: const AppBarTheme(
      color: Colors.white, titleTextStyle: TextStyle(color: Colors.white)),
  primaryColor: Colors.white,
);
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WebLoginProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool? isDarkThemeCached = false;
    // RouteSettings customRouteSettings =
    //     RouteSettings(name: "/splash", arguments: {"isDarkThemeCached": false});

    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Jubilant',
      debugShowCheckedModeBanner: false,
      checkerboardOffscreenLayers: false,
      checkerboardRasterCacheImages: false,
      initialRoute: kIsWeb ? WebRoutes.splash : MobileRoutes.splash,
      //  routes: kIsWeb ? WebPages().myRoutes : MobilePages().myRoutes,
      /*  onUnknownRoute: (settings) {
        return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation1, animation2) =>
                const WebErrorScreen());
      }, */
      onGenerateRoute: kIsWeb
          ? (settings) => WebPages.routes(settings)
          : (settings) => MobilePages.route(settings),

      useInheritedMediaQuery: true,
      theme: defaultTheme,
      darkTheme: darkTheme,
    );
  }
}
