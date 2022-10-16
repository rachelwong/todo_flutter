import 'package:flutter/material.dart';
import 'package:test_flutter/screens/home.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Home(),
    );
  }
}
