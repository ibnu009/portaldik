import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  const BottomNavigation({super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black54,
      items: <BottomNavigationBarItem>[
        bottomNavItem(0, CupertinoIcons.home, 'Beranda'),
        bottomNavItem(1, CupertinoIcons.person, 'Profil'),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }

  BottomNavigationBarItem bottomNavItem(int index, IconData icon, String label) {
    Color color;
    if (index == currentIndex) {
      color = Colors.blue;
    } else {
      color = Colors.black54;
    }
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: color,
        ),
        label: label);
  }
}