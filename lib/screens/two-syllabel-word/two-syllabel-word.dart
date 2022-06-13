// ignore_for_file: file_names

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:goodalph/components/drawer.dart';
import 'package:goodalph/components/navbar.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';
import 'package:goodalph/screens/two-syllabel-word/components/body.dart';
import 'package:im_animations/im_animations.dart';

class TwoSyllabelWord extends StatefulWidget {
  static String routeName = "/" + menu2;

  const TwoSyllabelWord({Key? key}) : super(key: key);

  @override
  State<TwoSyllabelWord> createState() => _TwoSyllabelWordState();
}

class _TwoSyllabelWordState extends State<TwoSyllabelWord> {
  int niveau = 0;
  int tentative = 0;
  bool animate = false;
  bool clicked = false;
  String keychaine = "Key 1";
  List<Map<String, List<dynamic>>> listNiveau = [];

  void isFinish() {
    generateKey();
    if(niveau == 3) {
      setState(() {
        niveau = 0;
      });
    }
  }

  void isGameOver() async {
    await animateEssai(5);
    if(tentative >= 4) {
      showEvent(context);
    } else if (tentative == 5) {
      setState(() {
        tentative = 4;
      });
    }
  }

  animateEssai(int counter) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        animate = true;
      });
      counter--;
      if (counter == 0) {
        timer.cancel();
        setState(() {
          animate = false;
        });
      }
    });
  }

  // String? key() {
  //   if(clicked == false) {
  //     return keychaine;
  //   } else {
  //     return keychaine;
  //   }
  // }

  generateKey() {
    setState(() {
      keychaine = "Key " + Random().nextInt(5).toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    listNiveau = jeuxmenu1.niveau;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        titre: "Niveau ${niveau+1}",
        text: animate == true
          ? HeartBeat(
              beatsPerMinute: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "essai ${tentative+1}/5",
                  style: const TextStyle(color: Color(0xFFFF7643)),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "essai ${tentative+1}/5",
                style: const TextStyle(color: Color(0xFFFF7643)),
              ),
            ),
      ),
      body: Body(
        key:  Key(keychaine),
        jeux: listNiveau[niveau],
        onLevel: (level) => setState(() => {
          niveau++,
          tentative = 0,
          isFinish(),
        }),
        onEssai: (essai) => setState(() => {
          tentative++,
          isGameOver(),
        }),
      ),
      drawer: GoodAlphDrawer(currentPage: menu2),
    );
  }

  void showEvent(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Icon(
          Icons.assignment_turned_in_rounded,
          size: 40,
          color: Colors.grey,
        ),
        content: Container(
          height: height(0.21, context),
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text(
                    'Voulez-vous continuer ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 1, fontSize: 15, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        onPressed: () => setState(() {
                          tentative = 0;
                          generateKey();
                          Navigator.pop(context);
                        }),
                        child: const Text(
                          'Oui',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Non',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
    );
  }
}