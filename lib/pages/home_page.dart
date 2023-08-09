import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finance_app/pages/daily_page.dart';
import 'package:flutter_finance_app/pages/profile.dart';
import 'package:flutter_finance_app/pages/transection_page.dart';
import 'package:flutter_finance_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  // ignore: prefer_typing_uninitialized_variables
  var ctime;

  List<Widget> pages = [
    const DailyPage(),
    const TransectionPage(),
    const TransectionPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: WillPopScope(
          onWillPop: () {
            DateTime now = DateTime.now();
            if (ctime == null ||
                now.difference(ctime) > const Duration(seconds: 2)) {
              ctime = now;
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  backgroundColor: black,
                  content:
                      Align(child: Text('Press back button again to exit'))));
              return Future.value(false);
            }

            return Future.value(true);
          },
          child: getBody()),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.home,
      CupertinoIcons.creditcard,
      CupertinoIcons.money_dollar,
      CupertinoIcons.person,
    ];
    return AnimatedBottomNavigationBar(
        backgroundColor: primary,
        icons: iconItems,
        splashColor: secondary,
        inactiveColor: black.withOpacity(0.5),
        gapLocation: GapLocation.none,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        elevation: 2,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
