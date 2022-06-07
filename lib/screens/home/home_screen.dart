import 'package:flutter/material.dart';
import 'package:goodalph/components/drawer.dart';
import 'package:goodalph/components/navbar.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/" + menu1;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(titre: menu1),
      body: Body(),
      drawer: GoodAlphDrawer(currentPage: menu1),
    );
  }
}