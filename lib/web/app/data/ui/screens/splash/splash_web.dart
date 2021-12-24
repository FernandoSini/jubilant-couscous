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

class _SplashWebState extends State<SplashWeb>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controllerAnimation;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerAnimation.dispose();
    super.dispose();
  }

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
    controllerAnimation =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);

    animation = Tween<double>(begin: 0, end: 150).animate(controllerAnimation)
      ..addListener(() {
        if (!mounted) return;
        setState(() {
          if (animation.status == AnimationStatus.completed) {
            controllerAnimation.repeat();
          }
        });
      });
    controllerAnimation.forward();
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
                ? darkTheme.backgroundColor
                : defaultTheme.backgroundColor,
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Container(
            decoration: BoxDecoration(
              color: !value
                  ? darkTheme.backgroundColor
                  : defaultTheme.backgroundColor,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
                  parent: controllerAnimation, curve: Curves.bounceInOut)),
              child: Image.asset(
                "./assets/logohayashi.png",
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
          ),
        );
      },
    );
  }
}
