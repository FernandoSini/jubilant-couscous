import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jubilant_couscous/mobile/app/data/routes/mobile_pages.dart';
import 'package:jubilant_couscous/mobile/app/data/routes/mobile_routes.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/base/mobile_base_screen.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_pages.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_routes.dart';
import 'package:jubilant_couscous/web/app/data/ui/screens/base/web_base_screen.dart';

final ThemeData darkTheme = ThemeData(
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(color: Colors.black),
  primaryColor: Colors.white,
);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jubilant couscous project',
      debugShowCheckedModeBanner: false,
      initialRoute: kIsWeb ? WebRoutes.base : MobileRoutes.base,
      onGenerateRoute: kIsWeb
          ? (settings) => WebPages.routes(settings)
          : (settings) => MobilePages.route(settings),
      useInheritedMediaQuery: true,
      darkTheme: darkTheme,
    );
  }
}
