// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:goodalph/components/drawer.dart';
import 'package:goodalph/components/navbar.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/screens/watch-video/components/body.dart';

class WatchVideo extends StatefulWidget {
  static String routeName = "/" + menu6;

  @override
  State<WatchVideo> createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(titre: menu6),
      body: const Body(),
      drawer: GoodAlphDrawer(currentPage: menu6),
    );
  }
}