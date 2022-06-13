import 'package:flutter/material.dart';
import 'package:goodalph/routes.dart';
import 'package:goodalph/screens/home/home_screen.dart';
import 'package:goodalph/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: theme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}