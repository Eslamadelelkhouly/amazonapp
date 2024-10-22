import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static recieveOTP({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      auth.verifyPhoneNumber(
        verificationCompleted: (PhoneAuthCredential credintial) {},
        verificationFailed: (FirebaseAuthException exception) {},
        codeSent: (String verficationID, int? resendToken) {},
        codeAutoRetrievalTimeout: (String verificationId){},
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
