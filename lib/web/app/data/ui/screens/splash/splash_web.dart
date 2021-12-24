import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jubilant_couscous/main.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_routes.dart';
import 'package:jubilant_couscous/web/app/data/ui/widgets/paintcustom.dart';

class SplashWeb extends StatefulWidget {
  const SplashWeb({Key? key, this.isDarkThemeCached}) : super(key: key);
  final bool? isDarkThemeCached;
  @override
  _SplashWebState createState() => _SplashWebState();
}

class _SplashWebState extends State<SplashWeb> {
  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      setState(() {
        widget.isDarkThemeCached == ModalRoute.of(context)?.settings.arguments;
      });
      Timer(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacementNamed(WebRoutes.home,
            arguments: widget.isDarkThemeCached);
      });
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacementNamed(WebRoutes.home,
            arguments: {"isDarkThemeCached": true});
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isDarkTheme =
        ValueNotifier<bool>(widget.isDarkThemeCached ?? false);
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkTheme,
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: !value
                ? defaultTheme.backgroundColor
                : darkTheme.backgroundColor,
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: CustomPaint(
            painter: PaintCustom(),
            child: Container(
              decoration: BoxDecoration(
                color: value
                    ? darkTheme.backgroundColor
                    : defaultTheme.backgroundColor,
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        );
      },
    );
  }
}
