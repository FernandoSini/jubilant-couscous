import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jubilant_couscous/main.dart';
import 'package:jubilant_couscous/mobile/app/data/routes/mobile_pages.dart';
import 'package:jubilant_couscous/mobile/app/data/routes/mobile_routes.dart';
import 'package:jubilant_couscous/mobile/app/data/ui/screens/home/home.dart';

class MobileBaseScreen extends StatefulWidget {
  const MobileBaseScreen({Key? key}) : super(key: key);

  @override
  _MobileBaseScreenState createState() => _MobileBaseScreenState();
}

class _MobileBaseScreenState extends State<MobileBaseScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: darkTheme.backgroundColor,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        alignment: Alignment.center,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (value) {},
            ),
            Text(
              "",
              style: TextStyle(color: ThemeData.dark().primaryColor),
            ),
            ElevatedButton(onPressed: () {}, child: Text("a"))
          ],
        ),
      ),
    );
  }
}
