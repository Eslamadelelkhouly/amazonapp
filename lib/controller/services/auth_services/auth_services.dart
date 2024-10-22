import 'dart:developer';

import 'package:amazonapp/view/auth_screen/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AuthServices {
  static recieveOTP({required BuildContext context , required String mobilenumber}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credintial) {
          log(credintial.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
        },
        codeSent: (String verficationID, int? resendToken) {
          Navigator.push(
            context,
            PageTransition(
              child: OtpScreen(mobilenumber: mobilenumber),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
