import 'package:flutter/widgets.dart';
import 'package:goodalph/screens/draggable_basic.dart';
import 'package:goodalph/screens/home/home_screen.dart';
import 'package:goodalph/screens/two-syllabel-word/two-syllabel-word.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  TwoSyllabelWord.routeName: (context) => TwoSyllabelWord(),
  // DraggableBasic.routeName: (context) => DraggableBasic(),
};
