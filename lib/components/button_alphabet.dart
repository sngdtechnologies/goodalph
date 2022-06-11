import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goodalph/models/Letter.dart';

import '../constants.dart';

class ButtonAlphabet extends StatefulWidget {
  const ButtonAlphabet({
    Key? key,
    required this.letter,
  }) : super(key: key);
  final Letter letter;

  @override
  State<ButtonAlphabet> createState() => _ButtonAlphabetState();
}

class _ButtonAlphabetState extends State<ButtonAlphabet> {
  Uint8List? a;
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      loadsound(widget.letter.sound).then((value) => a = value);
    });
    super.initState();
  }

  Future<Uint8List?> loadsound(String asset) async {
    
    if(widget.letter.sound == "assets/sound/A.mp3") {
      late Uint8List audiobytes;
      ByteData bytes = await rootBundle.load(asset); //load audio from assets
      audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      return audiobytes;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: height(0.4, context),
        height: width(0.2, context),
        child: TextButton(
          onPressed: () async {
            if(widget.letter.sound == "assets/sound/A.mp3") {
              int result = await player.playBytes(a!);
            } else {
              print(widget.letter.sound);
            }
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.letter.id.toString(),
              child: Image.asset(widget.letter.picture),
            ),
          ),
        ),
      );
  }
}
