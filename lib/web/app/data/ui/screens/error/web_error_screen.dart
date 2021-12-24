import 'package:flutter/material.dart';

class WebErrorScreen extends StatefulWidget {
  const WebErrorScreen({Key? key}) : super(key: key);

  @override
  _WebErrorScreenState createState() => _WebErrorScreenState();
}

class _WebErrorScreenState extends State<WebErrorScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
      ),
    );
  }
}
