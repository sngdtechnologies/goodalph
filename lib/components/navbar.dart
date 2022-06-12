// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:goodalph/constants.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String titre;
  final IconData icon;

  Navbar({
    this.titre = "Home",
    this.icon = Icons.menu,
  });

  final double _prefferedHeight = 56.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          iconSize: 30,
          color: Color(0xFF757575),
          icon: Icon(widget.icon),
          onPressed: () => (widget.icon == Icons.menu)
              ? Scaffold.of(context).openDrawer()
              : Navigator.pop(context)),
      title: Text(
        
        widget.titre, 
        style: TextStyle(color: Color(0xFF757575)),),
    );
  }
}
