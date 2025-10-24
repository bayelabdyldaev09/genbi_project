// ignore_for_file: deprecated_member_use, unused_import

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genbi_app/menu/explore_screen.dart';
import 'package:genbi_app/menu/profile_screen.dart';
import 'package:genbi_app/menu/save_screen.dart';
import 'package:genbi_app/menu/search_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int index = 0;

  final pages = [
    ExploreScreen(),
    SaveScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem('assets/explore.svg', 'Home', 0),
              _buildNavItem('assets/save.svg', 'Save', 1),
              _buildNavItem('assets/routing.svg', 'Plan', 2),
              _buildNavItem('assets/user.svg', 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String svgPath, String label, int itemIndex) {
    final bool selected = index == itemIndex;

    return GestureDetector(
      onTap: () => setState(() => index = itemIndex),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            height: selected ? 50 : 40,
            width: selected ? 50 : 40,
            decoration: BoxDecoration(
              color: selected ? const Color(0xFFF2F4FC) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                height: 25,
                width: 25,
                color: selected ? const Color(0xFF249191) : Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: selected ? const Color(0xFF249191) : Colors.grey,
              fontSize: 12,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
