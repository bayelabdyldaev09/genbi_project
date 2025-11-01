import 'package:flutter/material.dart';

class GradientOverlay extends StatelessWidget {
  final double width;
  final double height;

  const GradientOverlay({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [Colors.black, Colors.transparent],
        ),
      ),
    );
  }
}
