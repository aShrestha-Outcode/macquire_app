import 'package:flutter/material.dart';
import 'package:macquire_app/app_theme/app_theme.dart';
import 'package:macquire_app/app_theme/app_theme_manager.dart';
import 'package:macquire_app/modules/login_screen/login_screen.dart';

void main() {
  runApp(MaquireApp());
}

class MaquireApp extends StatefulWidget {
  const MaquireApp({super.key});

  @override
  State<MaquireApp> createState() => _MaquireAppState();
}

class _MaquireAppState extends State<MaquireApp> {
  @override
  void initState() {
    super.initState();
    _setUpThemeListener();
  }

  void _setUpThemeListener() {
    AppThemeManager().themeChanged = () {
      setState(() {});
    };
    AppThemeManager().setInitialTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().getCurrentTheme(context),
      home: const LoginScreen(),
    );
  }
}
