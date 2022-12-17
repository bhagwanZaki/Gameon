import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Gameon/utils/appcolor.dart';
import 'package:Gameon/utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, Routes.loginscreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Appcolor.green,
        ),
        child: Center(child: Image.asset('assets/image/logo.png')),
      ),
    );
  }
}
