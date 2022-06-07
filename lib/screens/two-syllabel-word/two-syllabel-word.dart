import 'package:flutter/material.dart';
import 'package:goodalph/components/draggable.dart';
import 'package:goodalph/components/drawer.dart';
import 'package:goodalph/components/navbar.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';
import 'package:goodalph/screens/two-syllabel-word/components/body.dart';

class TwoSyllabelWord extends StatefulWidget {
  static String routeName = "/" + menu2;

  @override
  State<TwoSyllabelWord> createState() => _TwoSyllabelWordState();
}

class _TwoSyllabelWordState extends State<TwoSyllabelWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(titre: menu2),
      body: Body(),
      drawer: GoodAlphDrawer(currentPage: menu2),
    );
  }
  // Widget build(BuildContext context) {
  //   final item = new Text('Madrid');
  //   final avatar = new Text('Madrid');
  //   final draggable = new Draggable<MultipleChoice>(
  //     data: multipleChoices.first,
  //     feedback: avatar,
  //     child: item,
  //     childWhenDragging: new Opacity(opacity: 0.0, child: item),
  //     onDraggableCanceled: (velocity, offset) {
  //       print('_DragBoxState.build -> offset ${offset}');
  //       setState(() => position = offset);
  //     });
  //   return new Positioned(
  //       left: position.dx, top: position.dy, child: draggable);
  // }
}