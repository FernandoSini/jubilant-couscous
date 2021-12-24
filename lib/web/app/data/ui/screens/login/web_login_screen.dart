import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jubilant_couscous/main.dart';
import 'package:jubilant_couscous/web/app/data/routes/web_routes.dart';

class WebLoginScreen extends StatefulWidget {
  const WebLoginScreen({Key? key}) : super(key: key);

  @override
  _WebLoginScreenState createState() => _WebLoginScreenState();
}

class _WebLoginScreenState extends State<WebLoginScreen> {
  bool isDarkModeCached = true;
  List<bool> onHoverList = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
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
                  arguments: {"isDarkThemeCached": false}),
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
              child: Text(
                "About me",
                style: TextStyle(
                    fontSize: 20,
                    color: onHoverList[0]
                        ? darkTheme.primaryColor
                        : defaultTheme.primaryColor),
              ),
            ),
            InkWell(
              onTap: () {},
              onHover: (value) => setState(() {
                onHoverList[1] = value;
              }),
              child: Text(
                "Youtube",
                style: TextStyle(
                    fontFamily: GoogleFonts.londrinaOutline().fontFamily,
                    fontSize: 20,
                    color: onHoverList[1]
                        ? darkTheme.primaryColor
                        : defaultTheme.primaryColor),
              ),
            ),
            InkWell(
              onTap: () {},
              onHover: (value) => setState(() {
                onHoverList[2] = value;
              }),
              child: Text(
                "Lives",
                style: TextStyle(
                    fontSize: 20,
                    color: onHoverList[2]
                        ? darkTheme.primaryColor
                        : defaultTheme.primaryColor),
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
      body: Container(),
    );
  }
}
