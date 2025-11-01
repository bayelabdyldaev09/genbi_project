import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genbi_app/data/models/chips_model.dart';

class ChipsList extends StatelessWidget {
  const ChipsList({
    super.key,
    required this.chips,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<Chips> chips;
  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => onTap(index),
            child: Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFF2F4FC) : Colors.white,
                border: Border.all(
                  width: 1,
                  color: isSelected ? Colors.transparent : Color(0xFFF2F4FC),
                ),
                borderRadius: BorderRadius.circular(38),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    chips[index].icon,
                    color: isSelected ? Color(0xFF249191) : Color(0xFF6B6E80),
                  ),
                  SizedBox(width: 8),
                  Text(
                    chips[index].title,
                    style: TextStyle(
                      color: isSelected ? Color(0xFF249191) : Color(0xFF6B6E80),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
