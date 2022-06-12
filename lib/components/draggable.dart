import 'package:flutter/material.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';

class DraggableWidget extends StatefulWidget {
  final String chaine;

  const DraggableWidget({Key? key, required this.chaine}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset position = new Offset(0.0, 0.0);
  bool wasAccepted = false;
  String activeLetterChoice = '';

  @override
  void initState() {
    super.initState();
    activeLetterChoice = widget.chaine;
  }

  @override
  Widget build(BuildContext context) {
    
    final item = choice(activeLetterChoice, Colors.black);
    return DragTarget(
      builder: (context, data, rejected) {
        return Draggable(
          data: activeLetterChoice,
          feedback: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: activeLetterChoice,
              style: TextStyle(
                color: Colors.black, 
                fontSize: 100
              ),
            ),
          ),
          child: item,
          maxSimultaneousDrags: 1,
          childWhenDragging: new Opacity(opacity: 0.0, child: item),
          onDragCompleted: () {
            // print('deplacement de ${activeLetterChoice}');
            setState(() => activeLetterChoice = '');
          }
        );
      },
      onWillAccept: (data) => activeLetterChoice == '',
      onAccept: (letter) => setState(() {
        activeLetterChoice = letter.toString();
        // print('la lettre ${activeLetterChoice} a ete accepter');
      }),
    );
  }
}