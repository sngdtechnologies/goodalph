// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String titre;
  final IconData icon;
  final Widget? text;

  Navbar({
    this.titre = "Home",
    this.icon = Icons.menu,
    this.text,
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
          color: const Color(0xFF757575),
          icon: Icon(widget.icon),
          onPressed: () => (widget.icon == Icons.menu)
              ? Scaffold.of(context).openDrawer()
              : Navigator.pop(context)),
      title: Center(
        child: Text(
          widget.titre,
          style: const TextStyle(color: Color(0xFF757575)),
        ),
      ),
      actions: [
        if (widget.text != null)
          widget.text!,
      ],
    );
  }
}