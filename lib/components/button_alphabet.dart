import 'package:flutter/material.dart';
import 'package:goodalph/models/Letter.dart';

import '../constants.dart';

class ButtonAlphabet extends StatelessWidget {
  const ButtonAlphabet({
    Key? key,
    required this.letter,
  }) : super(key: key);
  final Letter letter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: height(0.4, context),
        height: width(0.2, context),
        child: TextButton(
          onPressed: () => print(letter.sound),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: letter.id.toString(),
              child: Image.asset(letter.picture),
            ),
          ),
        ),
      );
  }
}
