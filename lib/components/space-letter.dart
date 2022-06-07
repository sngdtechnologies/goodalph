// ignore_for_file: deprecated_member_use, file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:goodalph/components/draggable.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';

class SpaceLetter extends StatefulWidget{
  final String chaine;
  final BuildContext context;
  final String acceptChaine;
  final DragTargetAccept<MultipleChoice> onAccept;

  SpaceLetter({
    required this.chaine, 
    required this.context, 
    required this.acceptChaine,
    required this.onAccept,
  });

  @override
  _SpaceLetterState createState() => _SpaceLetterState();
}

class _SpaceLetterState extends State<SpaceLetter> {
  String? selection;
  @override
  Widget build(BuildContext cont) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DragTarget(
            builder: (context, List<dynamic> accepted, List<dynamic> rejected) {
              final hovered = accepted.length > 0;
              return choice(selection!);
            },
            onWillAccept: (data) => selection == null,
            // onAccept: (data) {
            //   if (widget.acceptChaine.contains(data.correctLetter)) {
            //     print('this is correct word');
            //   } else {
            //     print('this is not correct word');
            //   }
              
            //   onAccept(data);
            // },
            onAccept: (value) => setState(() {
              selection = value as String;
            })
          ),
        ],
      ),
      width: 80.0,
      height: 80.0,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

void onAccept(MultipleChoice data) {
}