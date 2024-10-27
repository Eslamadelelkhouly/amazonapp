import 'package:flutter/material.dart';

class AuthProviderCreater extends ChangeNotifier {
  String phoneNumber = '';
  String verificationId = '';
  String OTP = '';

  updatePhoneNumber({required String num}) {
    phoneNumber = num;
    notifyListeners();
  }

  updateVerificationID({required String verfyid}) {
    verificationId = verfyid;
    notifyListeners();
  }
}
