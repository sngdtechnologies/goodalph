import 'package:flutter/material.dart';
import 'package:goodalph/routes.dart';
import 'package:goodalph/screens/home/home_screen.dart';
import 'package:goodalph/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: theme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}

// LikeButton(
//   size: buttonSize,
//   likeCount: likeCount,
//   key: _globalKey,
//   countBuilder: (int? count, bool isLiked, String text) {
//     final ColorSwatch<int> color =
//         isLiked ? Colors.pinkAccent : Colors.grey;
//     Widget result;
//     if (count == 0) {
//       result = Text(
//         'love',
//         style: TextStyle(color: color),
//       );
//     } else
//       result = Text(
//         count! >= 1000
//             ? (count / 1000.0).toStringAsFixed(1) + 'k'
//             : text,
//         style: TextStyle(color: color),
//       );
//     return result;
//   },
//   likeCountAnimationType: likeCount < 1000
//       ? LikeCountAnimationType.part
//       : LikeCountAnimationType.none,
//   likeCountPadding: const EdgeInsets.only(left: 15.0),
//   onTap: onLikeButtonTapped,
// ),