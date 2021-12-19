import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:jubilant_couscous/web/screens/base/web_base_screen.dart';

import 'mobile/screens/base/mobile_base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX project',
      initialRoute: "/base",
      getPages: [
        if (kIsWeb)
          GetPage(name: "/base", page: () => const WebBaseScreen(),)
        else
          GetPage(name: "/base", page: () => const MobileBaseScreen())
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: kIsWeb ? const WebBaseScreen() : const MobileBaseScreen(),
    );
  }
}
