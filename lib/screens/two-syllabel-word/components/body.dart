// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  Uint8List? letter1;
  Uint8List? letter2;
  AudioPlayer player = AudioPlayer();
  
  String activeLetter = '';
  String activeLetterChoice = '';

  String image = 'assets/images/flex.gif';
  bool firstletteriscorrect = false;
  bool secondletteriscorrect = false;
  Color errorColor = Colors.redAccent;
  
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      loadsound('assets/sound/A.mp3').then((value) => letter1 = value);
      loadsound('assets/sound/A.mp3').then((value) => letter2 = value);
    });
    super.initState();
  }

  Future<Uint8List?> loadsound(String asset) async {
    late Uint8List audiobytes;
    ByteData bytes = await rootBundle.load(asset); //load audio from assets
    audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    return audiobytes;
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
                    chaine: jeuxmenu1.niveau[0]['correctletter']![0], 
                    // context: context, 
                    // acceptChaine: 'champ2',
                    onAccept: (data) async {
                      if(data == jeuxmenu1.niveau[0]['correctletter']![0]) {
                        setState(() {
                          firstletteriscorrect = true;
                          image = 'assets/images/success.gif';
                        });
                        int result = await player.playBytes(letter1!);
                      } else {
                        setState(() {
                          firstletteriscorrect = false;
                          image = 'assets/images/try.gif';
                        });
                      }
                    }
                  ),
                  signe('+'),
                  SpaceLetter(
                    chaine: jeuxmenu1.niveau[0]['correctletter']![1], 
                    // context: context, 
                    // acceptChaine: 'champ2',
                   onAccept: (data) async {
                      if(data == jeuxmenu1.niveau[0]['correctletter']![1]) {
                        setState(() {
                          secondletteriscorrect = true;
                          image = 'assets/images/success.gif';
                        });
                        int result = await player.playBytes(letter2!);
                      } else {
                        setState(() {
                          secondletteriscorrect = false;
                          image = 'assets/images/try.gif';
                        });
                      }
                    }
                  ),
                  signe('='),
                  SpaceLetter(
                    chaine: jeuxmenu1.niveau[0]['correctletter']![2], 
                    word: true,
                    onAccept: (data) {}
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
