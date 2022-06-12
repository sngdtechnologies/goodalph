// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:goodalph/components/drawer.dart';
import 'package:goodalph/components/navbar.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/screens/two-syllabel-word/components/body.dart';

class TwoSyllabelWord extends StatefulWidget {
  static String routeName = "/" + menu2;

  @override
  State<TwoSyllabelWord> createState() => _TwoSyllabelWordState();
}

class _TwoSyllabelWordState extends State<TwoSyllabelWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(titre: menu2),
      body: const Body(),
      drawer: GoodAlphDrawer(currentPage: menu2),
    );
  }
}