import 'package:flutter/material.dart';
import 'package:genbi_app/location_screen.dart';
import 'package:genbi_app/splash_native.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: SplashNative()
    );
  }
}
