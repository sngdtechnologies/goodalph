import 'package:flutter/material.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';

class DraggableWidget extends StatefulWidget {
  final MultipleChoice chaine;

  const DraggableWidget({Key? key, required this.chaine}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset position = new Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    final item = choice(widget.chaine.choice);
    return Draggable<MultipleChoice>(
      data: widget.chaine,
      feedback: Text(
        widget.chaine.choice, 
        style: const TextStyle(
          color: Colors.black, 
          fontSize: 35), 
        textAlign: TextAlign.center,
      ),
      child: item,
      childWhenDragging: new Opacity(opacity: 0.0, child: item),
      onDraggableCanceled: (velocity, offset) {
        print('_DragBoxState.build -> offset ${offset}');
        setState(() => position = offset);
      }
    );
  }
}