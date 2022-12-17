import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Gameon/utils/appcolor.dart';
import 'package:Gameon/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PincodeScreen extends StatefulWidget {
  const PincodeScreen({super.key});

  @override
  State<PincodeScreen> createState() => _PincodeScreenState();
}

class _PincodeScreenState extends State<PincodeScreen> {
  final _formKey = GlobalKey<FormState>();
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String phoneNumber = args["phoneNumber"];

    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: 281,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Appcolor.green.withOpacity(0.9), BlendMode.srcOver),
                      image: const AssetImage("assets/image/bg.png"))),
              child: Center(
                child: Image.asset(
                  'assets/image/logo.png',
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                height: size.height - 240,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        const Text(
                          "Enter OTP",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: otpTextField(context),
                        ),
                        Text(
                          "OTP Send to $phoneNumber",
                          style: const TextStyle(
                              fontSize: 14,
                              color: Appcolor.green2,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Appcolor.green2,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "00:${_start < 10 ? '0' : ''}$_start",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Appcolor.green2,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                Routes.groundlistscreen, (route) => false);
                          }
                        },
                        color: Appcolor.green,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 42, vertical: 10),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  PinCodeTextField otpTextField(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      onChanged: (value) {},
      obscureText: true,
      obscuringCharacter: "*",
      keyboardType: TextInputType.number,
      cursorColor: Colors.black,
      textStyle: const TextStyle(
        color: Appcolor.green,
      ),
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      enableActiveFill: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 50,
        fieldWidth: 50,
        borderWidth: 0.5,
        activeFillColor: Appcolor.greenop,
        selectedFillColor: Appcolor.greenop,
        inactiveFillColor: const Color.fromRGBO(8, 143, 129, 0.08),
        inactiveColor: Appcolor.green,
        selectedColor: Appcolor.green,
      ),
    );
  }

  InputDecoration textDecoration() {
    return InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(8, 143, 129, 0.08),
        hintStyle: GoogleFonts.poppins(
            color: Appcolor.green, fontSize: 14, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Appcolor.green),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Appcolor.green),
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Appcolor.green),
            borderRadius: BorderRadius.circular(8)),
        hintText: "9900265566");
  }
}
