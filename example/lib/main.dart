import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navigation_action_bar/navigation_action_bar.dart';

void main() => runApp(MaterialApp(home: CustomNavigationBar()));

class CustomNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  double currentIndex = 0;
  Color unSelectedColor = Colors.grey;
  Color selectedColor = Colors.black;

  Widget bottomIconCustom(String path, {Function() onclick, Color color}) {
    return GestureDetector(
      onTap: onclick,
      child: SvgPicture.asset(
        path,
        height: 20,
        width: 20,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationActionBar(
        context: context,
        scaffoldColor: Colors.blueAccent,
        index: 0,
        accentColor: Colors.white,
        subItems: [
          NavBarItem(
            iconWidget:
                bottomIconCustom("asserts/images/phone-call.svg", onclick: () {
              print("clickedddd1111");
            }),
            size: 30,
          ),
          NavBarItem(
              iconWidget:
                  bottomIconCustom("asserts/images/whatsapp.svg", onclick: () {
                print("clickedddd1111222222");
              }),
              size: 30),
        ],
        mainIndex: 2,
        items: [
          NavBarItem(
              iconWidget: bottomIconCustom("asserts/images/ic_home.svg",
                  color: currentIndex == 0 ? selectedColor : unSelectedColor),
              size: 24),
          NavBarItem(
              iconWidget: bottomIconCustom("asserts/images/ic_upload_post.svg",
                  color: currentIndex == 1 ? selectedColor : unSelectedColor),
              size: 24),
          NavBarItem(
              iconWidget: bottomIconCustom("asserts/images/alarm.svg",
               ),
              size: 40),
          NavBarItem(
              iconWidget: bottomIconCustom("asserts/images/user.svg",
                  color: currentIndex == 3 ? selectedColor : unSelectedColor),
              size: 24),
          NavBarItem(
              iconWidget: bottomIconCustom("asserts/images/menu.svg",
                  color: currentIndex == 4 ? selectedColor : unSelectedColor),
              size: 24),
        ],
        onTap: (index) {
          print("amajset6e... ${index}");

          if (index == 2) {
          } else {
            setState(() {
              currentIndex = index;
            });
          }
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentIndex.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              bottomIconCustom("asserts/images/alarm.png"),
            ],
          ),
        ),
      ),
    );
  }
}
