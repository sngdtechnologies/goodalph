// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodalph/components/draggable.dart';
import 'package:goodalph/components/space-letter.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';

class Body extends StatefulWidget {
  final Function(Object)? onLevel;
  final Function(Object)? onEssai;
  final Map<String, List<dynamic>> jeux;

  Body({Key? key, 
    this.onLevel, 
    this.onEssai, 
    required this.jeux}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Uint8List? letter1;
  Uint8List? letter2;
  AudioPlayer player = AudioPlayer();

  int niveau = 0, tentative = 0;
  
  String activeLetter = '';
  String activeLetterChoice = '';

  String image = 'assets/images/flex.gif';
  bool firstletteriscorrect = false;
  bool secondletteriscorrect = false;
  Color errorColor = Colors.redAccent;

  List<int> l = [];
  
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      loadsound('assets/sound/A.mp3').then((value) => letter1 = value);
      loadsound('assets/sound/A.mp3').then((value) => letter2 = value);
    });
    var rng = new Random();
    int a;
    for (var i = 0; l.length < 6; i++) {
      a = rng.nextInt(6);
      if(!l.contains(a)) {
        l.add(a);
      }
    }
    super.initState();
  }

  Future<Uint8List?> loadsound(String asset) async {
    late Uint8List audiobytes;
    ByteData bytes = await rootBundle.load(asset); //load audio from assets
    audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    return audiobytes;
  }

  timer(String element, int counter) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if(element == 'error') image = 'assets/images/try.gif';
        if(element == 'success') image = 'assets/images/success.gif';
        if(element == 'other') image = 'assets/images/flex.gif';
      });
      counter--;
      if (counter == 0) {
        timer.cancel();
        setState(() {
          if(element == 'error') image = 'assets/images/flex.gif';
          if(element == 'success' && firstletteriscorrect == true && secondletteriscorrect == true) {
            image = 'assets/images/success.gif';
            niveau++;
            widget.onLevel!(niveau);
          } else {
            image = 'assets/images/flex.gif';
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SpaceLetter(
                    chaine: widget.jeux['correctletter']![0], 
                    // context: context, 
                    // acceptChaine: 'champ2',
                    onAccept: (data) async {
                      if(data == widget.jeux['correctletter']![0]) {
                        setState(() {
                          firstletteriscorrect = true;
                          timer('success', 3);
                        });
                        int result = await player.playBytes(letter1!);
                      } else {
                        setState(() {
                          firstletteriscorrect = false;
                          timer('error', 3);
                          tentative++;
                        });
                      }
                      widget.onEssai!(tentative);
                    },
                    onDragCompleted: () => timer('other', 3),
                  ),
                  signe('+'),
                  SpaceLetter(
                    chaine: widget.jeux['correctletter']![1], 
                    // context: context, 
                    // acceptChaine: 'champ2',
                   onAccept: (data) async {
                      if(data == widget.jeux['correctletter']![1]) {
                        setState(() {
                          secondletteriscorrect = true;
                          timer('success', 3);
                        });
                        int result = await player.playBytes(letter2!);
                      } else {
                        setState(() {
                          secondletteriscorrect = false;
                          timer('error', 3);
                          tentative++;
                        });
                      }
                      widget.onEssai!(tentative);
                    },
                    onDragCompleted: () => timer('other', 3),
                  ),
                  signe('='),
                  SpaceLetter(
                    chaine: widget.jeux['correctletter']![2], 
                    word: true,
                    onAccept: (data) {},
                    onDragCompleted: () {},
                  ),
                ],
              ), 
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60.0,
                backgroundImage: AssetImage(image),
              ),
              Container(
                child: GridView.builder(
                  itemCount: widget.jeux['choice']!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return DraggableWidget(chaine: widget.jeux['choice']![l[index]]);
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
