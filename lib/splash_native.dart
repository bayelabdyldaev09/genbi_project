import 'package:flutter/material.dart';
import 'package:genbi_app/preview_screen.dart';

class SplashNative extends StatefulWidget {
  const SplashNative({super.key});

  @override
  State<SplashNative> createState() => _SplashNativeState();
}

class _SplashNativeState extends State<SplashNative> {
    @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => PreviewScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // ignore: deprecated_member_use
        child: Image.asset('assets/splash_screen.png', fit: BoxFit.cover,),
      ),
    );
  }
}