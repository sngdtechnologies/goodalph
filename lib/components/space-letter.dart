// ignore_for_file: deprecated_member_use, file_names

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:goodalph/components/draggable.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';

class SpaceLetter extends StatefulWidget{
  final String chaine;
  final bool? word;
  // final BuildContext context;
  // final String acceptChaine;
  final DragTargetAccept<String> onAccept;
  final Function? onDragCompleted;

  SpaceLetter({
    required this.chaine, 
    this.word = false, 
    // required this.context, 
    // required this.acceptChaine,
    required this.onAccept,
    required this.onDragCompleted,
  });

  @override
  _SpaceLetterState createState() => _SpaceLetterState();
}

class _SpaceLetterState extends State<SpaceLetter> {
  bool iscorrect = false;
  String activeLetterChoice = '';
  Color errorColor = Colors.redAccent;

  @override
  Widget build(BuildContext cont) {
    final item = choice(activeLetterChoice, Colors.white);
    return widget.word == false
            ? DragTarget(
                builder: (context, data, rejected) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Draggable(
                          data: activeLetterChoice,
                          feedback: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: activeLetterChoice,
                              style: TextStyle(
                                color: Colors.black, 
                                fontSize: 100
                              ),
                            ),
                          ),
                          child: item,
                          maxSimultaneousDrags: 1,
                          childWhenDragging: new Opacity(opacity: 0.0, child: item),
                          onDragCompleted: () => setState(() {
                            activeLetterChoice = '';
                            iscorrect = false;
                            widget.onDragCompleted!();
                          }),
                        ),
                      ],
                    ),
                    width: 80.0,
                    height: 80.0,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: iscorrect == false ? errorColor : Color(0xFF4A3298),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
                onWillAccept: (data) => activeLetterChoice == '',
                onAccept: (letter) => setState(() {
                  // print('la lettre ${letter} a ete accepter oui');
                  activeLetterChoice = letter.toString();
                  if(letter == widget.chaine) {
                    iscorrect = true;
                  } else {
                    iscorrect = false;
                  }
                  widget.onAccept(letter as String);
                }),
              )
            : Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    choice(widget.chaine, Colors.white),
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