import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(
            title: 'Today',
            svgSrc: 'assets/icons/calendar.svg',
            onPressed: () {},
          ),
          BottomNavItem(
            title: 'All Exercises',
            svgSrc: 'assets/icons/gym.svg',
            onPressed: () {},
            isActive: true,
          ),
          BottomNavItem(
            title: 'Settings',
            svgSrc: 'assets/icons/Settings.svg',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  final String svgSrc;
  final String title;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgSrc,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? kActiveIconColor : kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
