// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genbi_app/presentation/menu/menu_screen.dart';
import 'package:genbi_app/presentation/primary_pages/sign_in_screen.dart';

import '../../../domain/login_usecase.dart';
import '../../../data/auth_repository_impl.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  String? _usernameError;
  String? _passwordError;

  final LoginUseCase _loginUseCase = LoginUseCase(AuthRepositoryImpl());

  final String correctUsername = 'admin';
  final String correctPassword = '12345';

  void _login() {
    setState(() {
      _usernameError = null;
      _passwordError = null;
    });

    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    final success = _loginUseCase.call(username, password);

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MenuScreen()),
      );
    } else {
      setState(() {
        _usernameError = 'Неверное имя пользователя или пароль';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    final success = _loginUseCase.call(username, password);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          children: [
            SizedBox(height: 88),
            Text(
              'Log In To Your Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome back! Please log in to your account to continue where you left off.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 57),
            titleText('Name'),
            SizedBox(height: 8),
            TextField(
              controller: _usernameController,
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.transparent,
              decoration: inputDecoration(
                hintText: "Name",
                assetIconPath: 'assets/user.svg',
              ),
              onChanged: (_) => setState(() {}),
            ),
            SizedBox(height: 16),
            titleText('Password'),
            SizedBox(height: 8),
            TextField(
              controller: _passwordController,
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
              onChanged: (_) => setState(() {}),
            ),
            SizedBox(height: 42),
            InkWell(
              onTap: success ? _login : null,
              child: Container(
                width: double.infinity,
                height: 52,
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
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      side: const BorderSide(color: Colors.grey, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      checkColor: Color(0xFF249191),
                      activeColor: Colors.transparent,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                    ),
                    Text('Remember Me', style: TextStyle(fontSize: 13)),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Color(0xFF249191),
                    ),
                  ),
                ),
              ],
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

  bool _isChecked = false;
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
