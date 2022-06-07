// ignore_for_file: file_names

import 'package:goodalph/constants.dart';

class MultipleChoice {
  final int id;
  final String view;
  final String choice;
  final String correctLetter;

  MultipleChoice({
    required this.id,
    required this.view,
    required this.choice,
    required this.correctLetter, 
  });
}

// Our demo MultipleChoices

List<MultipleChoice> multipleChoices = [
  MultipleChoice(
    id: 1,
    view: menu2,
    choice: 'b',
    correctLetter: 'champ1'
  ),
  MultipleChoice(
    id: 2,
    view: menu2,
    choice: 'a',
    correctLetter: 'champ2'
  ),
  MultipleChoice(
    id: 1,
    view: menu2,
    choice: 's',
    correctLetter: 'non'
  ),
  MultipleChoice(
    id: 1,
    view: menu2,
    choice: 't',
    correctLetter: 'non'
  ),
  MultipleChoice(
    id: 1,
    view: menu2,
    choice: 'i',
    correctLetter: 'non'
  ),
  MultipleChoice(
    id: 1,
    view: menu2,
    choice: 'e',
    correctLetter: 'non'
  ),
];