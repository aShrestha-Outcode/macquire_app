import 'package:flutter/material.dart';
import 'package:macquire_app/app_theme/app_theme_manager.dart';
import 'package:macquire_app/app_theme/app_theme_type.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObsecure = false;
  bool _isLogin = true;

  _togglePasswordObscure() {
    _isPasswordObsecure = !_isPasswordObsecure;
    setState(() {});
  }

  _onLoginButtonClick() {
    _isLogin = !_isLogin;
    AppThemeManager()
        .changeTheme(_isLogin ? AppThemeType.dark : AppThemeType.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Maquire University App',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Login',
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  label: Text('Enter Email',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: _isPasswordObsecure,
              decoration: InputDecoration(
                  suffix: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        _togglePasswordObscure();
                      },
                      icon: Icon(_isPasswordObsecure
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  label: Text('Enter Password',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500))),
            ),
            const SizedBox(
              height: 7,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {
                      debugPrint('Clicked forgot password');
                    },
                    child: const Text('Forgot Password?'))),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  _onLoginButtonClick();
                },
                child: Container(
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  debugPrint('Clicked Continue as guest');
                },
                child: Text(
                  'Continue as a guest?',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
