import 'package:flutter/widgets.dart';
import 'package:goodalph/screens/home/home_screen.dart';
import 'package:goodalph/screens/two-syllabel-word/two-syllabel-word.dart';
import 'package:goodalph/screens/watch-video/watch-video.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  TwoSyllabelWord.routeName: (context) => TwoSyllabelWord(),
  WatchVideo.routeName: (context) => WatchVideo(),
};
