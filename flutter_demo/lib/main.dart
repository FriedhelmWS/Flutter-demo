import 'package:flutter/material.dart';
import 'package:flutter_demo/home.dart';

void main() {
  // this is compursolary
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Some important cross-App setting here
    return MaterialApp(
      title: 'HRE Tool',
      theme: ThemeData(
        // There common way of using colours:
        // Colors.red, Color(0xff00ff00), Color.fromARGB(255, 105, 105, 105)
        primarySwatch: Colors.grey,
      ),
      // the home is just the first page when you open the app
      home: const HomePage(title: 'Home'),
    );
  }
}
