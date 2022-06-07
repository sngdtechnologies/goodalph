import 'package:flutter/material.dart';
import 'package:goodalph/components/button_alphabet.dart';
import 'package:goodalph/models/Letter.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: GridView.builder(
          itemCount: letters.length,
          itemBuilder: (BuildContext context, int index) {
            //return Image.asset(images[index], fit: BoxFit.cover);
            return ButtonAlphabet(letter: letters[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
