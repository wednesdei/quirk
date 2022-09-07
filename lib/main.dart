import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quirk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Quirk(title: 'Quirk'),
    );
  }
}

class Quirk extends StatefulWidget {
  const Quirk({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Quirk> createState() => _QuirkState();
}

class _QuirkState extends State<Quirk> {
  @override
  Widget build(BuildContext context) {
    return const Text('Work in progress');
  }
}
