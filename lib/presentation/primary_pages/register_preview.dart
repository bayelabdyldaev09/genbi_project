import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genbi_app/presentation/primary_pages/log_in_screen.dart';
import 'package:genbi_app/presentation/primary_pages/sign_in_screen.dart';

class RegisterPreview extends StatelessWidget {
  const RegisterPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            SizedBox(height: 88),
            Text(
              'Let\'s Get Started',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to you journey! We\'re thrilled to have you here',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 153),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: Color(0xFFF6F8FF)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/google.svg'),
                  SizedBox(width: 5),
                  Text(
                    'Continue with Google',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: Color(0xFFF6F8FF)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/apple.svg'),
                  SizedBox(width: 5),
                  Text(
                    'Continue with Apple',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(0xFFF6F8FF),
                    thickness: 1,
                    endIndent: 10,
                  ),
                ),
                const Text(
                  "Or",
                  style: TextStyle(color: Color(0x704B4F63), fontSize: 16),
                ),
                Expanded(
                  child: Divider(
                    color: Color(0xFFF6F8FF),
                    thickness: 1,
                    indent: 10,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFF249191),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 137),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Color(0x704B4F63)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF249191),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
