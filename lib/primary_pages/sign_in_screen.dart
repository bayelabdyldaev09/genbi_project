import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genbi_app/primary_pages/log_in_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          children: [
            SizedBox(height: 72),
            Text(
              'Create Your Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Please fill in your details to create your account and enjoy our services.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 26),
            titleText('Full Name'),
            SizedBox(height: 8),
            TextField(
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.transparent,
              decoration: inputDecoration(
                hintText: "Full Name",
                assetIconPath: 'assets/user.svg',
              ),
            ),
            SizedBox(height: 16),
            titleText('Email'),
            SizedBox(height: 8),
            TextField(
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.transparent,
              decoration: inputDecoration(
                hintText: 'Email',
                assetIconPath: 'assets/sms.svg',
              ),
            ),
            SizedBox(height: 16),
            titleText('Password'),
            SizedBox(height: 8),
            TextField(
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.transparent,
              obscureText: _obscureText,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 15),
                hintText: 'Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset('assets/lock.svg'),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: SvgPicture.asset(
                    _obscureText ? 'assets/hide.svg' : 'assets/show.svg',
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintStyle: const TextStyle(
                  color: Color(0x704B4F63),
                  fontSize: 14,
                ),
                enabledBorder: outlineInputBorder(Color(0xFFF6F8FF)),
                focusedBorder: outlineInputBorder(Color(0xFFF6F8FF)),
                errorBorder: outlineInputBorder(Colors.red),
                focusedErrorBorder: outlineInputBorder(Colors.red),
              ),
            ),
            SizedBox(height: 42),
            Container(
              width: double.infinity,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFF249191),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(height: 42),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                twoBtnsDown('assets/google.svg'),
                twoBtnsDown('assets/apple.svg'),
              ],
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Color(0x704B4F63)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  },
                  child: Text(
                    'Log In',
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

  Container twoBtnsDown(String logo) {
    return Container(
      width: 163,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xFFF6F8FF)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.asset(logo),
    );
  }

  bool _obscureText = true;

  Row titleText(String title) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  InputDecoration inputDecoration({
    required String hintText,
    required String assetIconPath,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.only(left: 15),
      hintText: hintText,
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SvgPicture.asset(assetIconPath),
      ),
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: Color(0x704B4F63), fontSize: 14),
      enabledBorder: outlineInputBorder(Color(0xFFF6F8FF)),
      focusedBorder: outlineInputBorder(Color(0xFFF6F8FF)),
      errorBorder: outlineInputBorder(Colors.red),
      focusedErrorBorder: outlineInputBorder(Colors.red),
    );
  }

  OutlineInputBorder outlineInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderColor, width: 1),
    );
  }
}
