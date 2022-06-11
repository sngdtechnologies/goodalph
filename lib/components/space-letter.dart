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
  // final Function onAccept;

  SpaceLetter({
    required this.chaine, 
    this.word = false, 
    // required this.context, 
    // required this.acceptChaine,
    // required this.onAccept,
  });

  @override
  _SpaceLetterState createState() => _SpaceLetterState();
}

class _SpaceLetterState extends State<SpaceLetter> {
  bool wasAccepted = false;
  String activeLetterChoice = '';

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
                          childWhenDragging: new Opacity(opacity: 0.0, child: item),
                          onDragEnd: (data) {
                            print('letter onAccept in list choice ${data.wasAccepted}');
                            if(data.wasAccepted == true) {
                              setState(() => activeLetterChoice = '');
                            } else {
                              setState(() => activeLetterChoice = widget.chaine);
                            }
                            // print(data.wasAccepted);
                            // print('_DragBoxState.build -> offset ${offset}');
                            // setState(() => position = offset);
                          }
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
                },
                onAccept: (letter) => setState(() {
                  print('onAccept in space');
                  if(activeLetterChoice == '') {
                    activeLetterChoice = letter.toString();
                  }
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