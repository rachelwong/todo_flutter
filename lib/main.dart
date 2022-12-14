import 'package:flutter/material.dart';
import 'package:test_flutter/screens/home.dart';
import 'package:test_flutter/screens/Login.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp(VRouter(debugShowCheckedModeBanner: false, routes: [
    VWidget(path: "/", widget: Login()),
  ]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Home(name: "Default"),
    );
  }
}
