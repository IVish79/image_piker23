import 'package:flutter/material.dart';
import 'package:image_piker23/Midea_home.dart';
import 'package:image_piker23/image_home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.lightGreen)),
    home: Midea_home()
  ));
}
