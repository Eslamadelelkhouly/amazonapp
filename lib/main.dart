import 'package:amazonapp/utils/theme.dart';
import 'package:amazonapp/view/auth_screen/auth_screen.dart';
import 'package:amazonapp/view/auth_screen/otp_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      // home: OtpScreen(
      //   mobilenumber: '+91101101010',
      // ),
      home: AuthScreen(),
    );
  }
}
