import 'package:flutter/material.dart';
class MobileBaseScreen extends StatefulWidget {
  const MobileBaseScreen({ Key? key }) : super(key: key);

  @override
  _MobileBaseScreenState createState() => _MobileBaseScreenState();
}

class _MobileBaseScreenState extends State<MobileBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}