// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:genbi_app/presentation/menu/menu_screen.dart';
import 'package:genbi_app/presentation/menu/nature_page.dart';
import 'package:genbi_app/presentation/primary_pages/location_screen.dart';
import 'package:genbi_app/presentation/primary_pages/log_in_screen.dart';
import 'package:genbi_app/presentation/primary_pages/register_preview.dart';
import 'package:genbi_app/presentation/primary_pages/splash_native.dart';
import 'package:genbi_app/presentation/primary_pages/sign_in_screen.dart';
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
      home: MenuScreen()
    );
  }
}
