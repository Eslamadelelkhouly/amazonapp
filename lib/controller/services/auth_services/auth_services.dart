import 'dart:developer';

import 'package:amazonapp/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazonapp/view/auth_screen/otp_screen.dart';
import 'package:amazonapp/view/auth_screen/signInLogic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthServices {
  static bool CheckAuthentication() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      return true;
    }
    return false;
  }

  static recieveOTP(
      {required BuildContext context, required String mobilenumber}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobilenumber,
        verificationCompleted: (PhoneAuthCredential credintial) {
          log(credintial.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
        },
        codeSent: (String verficationID, int? resendToken) {
          context
              .read<AuthProviderCreater>()
              .updateVerificationID(verfyid: verficationID);
          context
              .read<AuthProviderCreater>()
              .updatePhoneNumber(num: mobilenumber);
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

  static verifyOTP({required BuildContext context, required String otp}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<AuthProviderCreater>().verificationId,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        PageTransition(
          child: Signinlogic(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
