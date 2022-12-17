import 'package:flutter/material.dart';
import 'package:Gameon/screen/auth/login_screen.dart';
import 'package:Gameon/screen/auth/pin_code_screen.dart';
import 'package:Gameon/screen/auth/splash_screen.dart';
import 'package:Gameon/screen/main/ground_detail_screen.dart';
import 'package:Gameon/screen/main/ground_list_screen.dart';
import 'package:Gameon/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gameon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true, textTheme: GoogleFonts.poppinsTextTheme()),
      home: const SplashScreen(),
      routes: {
        Routes.splashscreen: (context) => const SplashScreen(),
        Routes.loginscreen: (context) => const LoginScreen(),
        Routes.otpscreen: (context) => const PincodeScreen(),
        Routes.groundlistscreen: (context) => const GroundListScreen(),
        Routes.grounddetailscreen: (context) => const GoundDetailScreen()
      },
    );
  }
}
