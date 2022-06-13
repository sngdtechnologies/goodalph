// ignore_for_file: file_names

import 'package:goodalph/constants.dart';

class MultipleChoice {
  final int id;
  final String view;
  final List<Map<String, List>> niveau;

  MultipleChoice({
    required this.id,
    required this.view,
    required this.niveau, 
  });
}

// Our demo MultipleChoices
MultipleChoice jeuxmenu1 = MultipleChoice(
  id: 1,
  view: menu2,
  niveau: [
    {
      'correctletter': ['b', 'a', 'ba'],
      'choice': ['a', 't', 's', 'i', 'o', 'b'],
    },
    {
      'correctletter': ['c', 'a', 'ca'],
      'choice': ['a', 'c', 'h', 'o', 'n', 'p'],
    },
    {
      'correctletter': ['d', 'a', 'da'],
      'choice': ['a', 'c', 's', 'd', 'o', 'b'],
    }
  ],
);