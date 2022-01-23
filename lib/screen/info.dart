///
/// screen/home.dart
///
import 'package:flutter/material.dart';

class InfosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[Text("I am a text")],
      ),
    );
  }
}
