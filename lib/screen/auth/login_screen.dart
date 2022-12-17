import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Gameon/utils/appcolor.dart';
import 'package:Gameon/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Global Variables
  final _formKey = GlobalKey<FormState>();
  TextEditingController phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                          "Hi!",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'Lets Get Started',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Appcolor.green2),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Enter Phone Number",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Form(
                          key: _formKey,
                          child: IntlPhoneField(
                            controller: phonenumber,
                            validator: (value) {
                              if (value == null) {
                                return 'Enter Phone Number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            initialCountryCode: 'IN',
                            showDropdownIcon: false,
                            showCountryFlag: false,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: textDecoration(),
                          ),
                        ),
                      ],
                    )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Routes.otpscreen, (route) => false,
                                    arguments: {
                                      'phoneNumber': phonenumber.text
                                    });
                              }
                            },
                            color: Appcolor.green,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 42, vertical: 10),
                            child: const Text(
                              "Get OTP",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          const Text(
                            "Have A Pin?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Appcolor.green2,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ],
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
        hintText: "Phone Number");
  }
}
