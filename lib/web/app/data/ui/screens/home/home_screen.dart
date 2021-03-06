import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jubilant_couscous/main.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_pages.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_routes.dart';

class WebHome extends StatefulWidget {
  const WebHome({Key? key, this.argument}) : super(key: key);
  final Object? argument;

  @override
  _WebHomeState createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  bool isDarkModeCached = true;
  List<bool> onHoverList = [false, false, false, false];

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)?.settings.arguments == null) {
      Timer(const Duration(seconds: 0), () {
        Navigator.of(context).pushReplacementNamed(WebRoutes.splash);
      });
    } else {
      setState(() {
        isDarkModeCached = (ModalRoute.of(context)?.settings.arguments
                as Map)["isDarkThemeCached"] ??
            false;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    TextStyle textStyle = TextStyle();
    /* if (ModalRoute.of(context)?.settings.arguments != null) {
      /* isDarkModeCached = (ModalRoute.of(context)?.settings.arguments
          as Map)["isDarkModeCached"] as bool; */
      print("teste" + ModalRoute.of(context)!.settings.arguments.toString());
    } else {
      isDarkModeCached = false;
    } */

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: isDarkModeCached
            ? darkTheme.appBarTheme.backgroundColor
            : defaultTheme.appBarTheme.backgroundColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () => Navigator.of(context).pushReplacementNamed(
                  WebRoutes.home,
                  arguments: {"isDarkThemeCached": true}),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("./assets/logohayashi.png"),
              ),
            ),
            InkWell(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(WebRoutes.login),
              onHover: (value) => setState(() {
                onHoverList[0] = value;
              }),
              child: isDarkModeCached
                  ? Text(
                      "About me",
                      style: TextStyle(
                          fontSize: 20,
                          color: onHoverList[0]
                              ? darkTheme.primaryColor
                              : defaultTheme.primaryColor),
                    )
                  : Text(
                      "About me",
                      style: TextStyle(
                          fontSize: 20,
                          color: onHoverList[0]
                              ? darkTheme.primaryColor
                              : Colors.black),
                    ),
            ),
            InkWell(
              onTap: () {},
              onHover: (value) => setState(() {
                onHoverList[1] = value;
              }),
              child: isDarkModeCached
                  ? Text(
                      "Youtube",
                      style: TextStyle(
                          fontFamily: GoogleFonts.londrinaOutline().fontFamily,
                          fontSize: 20,
                          color: onHoverList[1]
                              ? darkTheme.primaryColor
                              : defaultTheme.primaryColor),
                    )
                  : Text(
                      "Youtube",
                      style: TextStyle(
                          fontFamily: GoogleFonts.londrinaOutline().fontFamily,
                          fontSize: 20,
                          color: onHoverList[1]
                              ? darkTheme.primaryColor
                              : Colors.black),
                    ),
            ),
            InkWell(
              onTap: () {},
              onHover: (value) => setState(() {
                onHoverList[2] = value;
              }),
              child: isDarkModeCached
                  ? Text(
                      "Lives",
                      style: TextStyle(
                          fontSize: 20,
                          color: onHoverList[2]
                              ? darkTheme.primaryColor
                              : defaultTheme.primaryColor),
                    )
                  : Text(
                      "Lives",
                      style: TextStyle(
                          fontSize: 20,
                          color: onHoverList[2]
                              ? darkTheme.primaryColor
                              : Colors.black),
                    ),
            ),
            SizedBox(
              width: 100,
            )
          ],
        ),
        /* leading: Container(
          height: 200,
          width: 200,
          child: Image.asset("./assets/logohayashi.png"),
        ),
        leadingWidth: 200, */
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        actions: [
          Icon(Icons.add),
          Icon(Icons.add),
          Icon(Icons.add),
          Icon(Icons.add),
          Icon(Icons.add),
          SizedBox(
            width: 100,
          )
        ],
      ),
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        color: isDarkModeCached
            ? darkTheme.backgroundColor
            : defaultTheme.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: screenSize.height * .25,
                width: screenSize.width,
                alignment: Alignment.center,
                child: Text(
                  "cu",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: screenSize.height * .25,
                alignment: Alignment.center,
                width: screenSize.width,
                child: Text(
                  "maconha",
                  style: TextStyle(color: darkTheme.primaryColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: screenSize.height * .25,
                width: screenSize.width,
                child: Text("cu", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
