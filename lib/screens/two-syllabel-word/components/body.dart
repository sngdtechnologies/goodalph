// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goodalph/components/draggable.dart';
import 'package:goodalph/components/space-letter.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool insideTarget = false;
  String activeLetter = '';
  String activeLetterChoice = '';
  
  @override
  Widget build(BuildContext context) {
    MultipleChoice champ1;
    MultipleChoice champ2;

    void removeAll(MultipleChoice toRemove) {
      // multipleChoices.removeWhere((element) => element.choice == toRemove.choice);
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Container(
          height: height(0.8, context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SpaceLetter(
                    chaine: jeuxmenu1.niveau[0]['correctletter']![0], 
                    // context: context, 
                    // acceptChaine: 'champ2',
                    // onAccept: (data) => setState(() {
                    // }),
                  ),
                  signe('+'),
                  SpaceLetter(
                    chaine: jeuxmenu1.niveau[0]['correctletter']![1], 
                    // context: context, 
                    // acceptChaine: 'champ2',
                    // onAccept: (data) => setState(() {
                    // }),
                  ),
                  signe('='),
                  SpaceLetter(
                  chaine: jeuxmenu1.niveau[0]['correctletter']![2], 
                  word: true,
                  //   context: context, 
                  //   acceptChaine: 'non',
                  //   onAccept: (data) => {},
                  ),
                ],
              ), 
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60.0,
                backgroundImage: AssetImage('assets/images/flex.gif'),
              ),
              Container(
                child: GridView.builder(
                  itemCount: jeuxmenu1.niveau[0]['choice']!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DraggableWidget(chaine: jeuxmenu1.niveau[0]['choice']![index]);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
