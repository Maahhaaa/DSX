import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gp/page_indactor.dart';


void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageIndactor(),
    );
  }
}
