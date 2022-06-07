// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:goodalph/constants.dart';

// import 'package:argon_flutter/constants/Theme.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool isSelected;
  final Color iconColor;

  DrawerTile(
      {required this.title,
      required this.onTap,
      this.isSelected = false,
      this.iconColor = kPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: isSelected ? iconColor : defaultColor,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(title,
                style: TextStyle(
                    letterSpacing: 1,
                    fontSize: 15,
                    color: isSelected
                        ? kPrimaryLightColor
                        : Color.fromRGBO(0, 0, 0, 0.7))),
          )),
    );
  }
}
