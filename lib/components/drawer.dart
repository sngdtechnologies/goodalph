import 'package:flutter/material.dart';
import 'package:goodalph/components/drawer-tile.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/screens/home/home_screen.dart';
import 'package:goodalph/screens/two-syllabel-word/two-syllabel-word.dart';
import 'package:goodalph/screens/watch-video/watch-video.dart';

class GoodAlphDrawer extends StatelessWidget {
  final String currentPage;

  GoodAlphDrawer({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
      color: kPrimaryLightColor,
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.94,
            child: SafeArea(
              // bottom: false,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage('assets/images/A.jpg'),
                      ),
                      Flexible(
                        child: Text(
                          '',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6.0),
                    bottomLeft: Radius.circular(6.0)),
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'),
                  fit: BoxFit.fitWidth,
                ))),
        Expanded(
          flex: 2,
          child: ListView(
            padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
            children: [
              // Divider(height: 4, thickness: 0, color: ArgonColors.muted),

              DrawerTile(
                  onTap: () {
                    if (currentPage != menu1) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }
                  },
                  iconColor: kPrimaryColor,
                  title: menu1,
                  isSelected: currentPage == menu1 ? true : false),
              space,
              DrawerTile(
                  onTap: () {
                    if (currentPage != menu2) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, TwoSyllabelWord.routeName);
                    }
                  },
                  iconColor: kPrimaryColor,
                  title: menu2,
                  isSelected: currentPage == menu2 ? true : false),
              space,
              DrawerTile(
                  onTap: () {
                    if (currentPage != menu6) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, WatchVideo.routeName);
                    }
                  },
                  iconColor: kPrimaryColor,
                  title: menu6,
                  isSelected: currentPage == menu6 ? true : false),
            ],
          ),
        ),
      ]),
    ));
  }
}
