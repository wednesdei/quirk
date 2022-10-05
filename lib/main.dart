import 'package:flutter/material.dart';
import 'package:quirk/packages/quirk-experimental-01/stars.dart';
import 'ui/app/color_schemes.g.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      // ignore: prefer_const_constructors
      home: StarPainter(),
    );
  }
}
