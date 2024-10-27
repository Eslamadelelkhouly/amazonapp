import 'package:amazonapp/constants/common_function.dart';
import 'package:amazonapp/controller/services/auth_services/auth_services.dart';
import 'package:amazonapp/utils/colors.dart';
import 'package:amazonapp/view/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.mobilenumber});
  final String mobilenumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        title: Image(
          image: const AssetImage('assets/images/amazon_logo.png'),
          height: height * 0.04,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Authentication Required',
                style: textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonFunction.blankSpace(height * 0.01, 0),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.mobilenumber,
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' change',
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              CommonFunction.blankSpace(height * 0.02, 0),
              Text(
                'we have send a One Time Password (OTP) to the mobile number above. please enter it to complete verification',
                style: textTheme.bodyMedium,
              ),
              CommonFunction.blankSpace(height * 0.02, 0),
              TextField(
                controller: otpController,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  hintStyle: textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: secondaryColor,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: grey),
                  ),
                ),
              ),
              CommonFunction.blankSpace(height * 0.01, 0),
              CommonAuthButton(
                width: 0.94,
                title: 'Continue',
                onPressed: () {
                  AuthServices.verifyOTP(
                    context: context,
                    otp: otpController.text.trim(),
                  );
                },
              ),
              CommonFunction.blankSpace(height * 0.02, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend OTP',
                      style: textTheme.bodyMedium!.copyWith(
                        color: blue,
                      ),
                    ),
                  ),
                ],
              ),
              CommonFunction.blankSpace(height * 0.02, 0),
              const ButtomAuthScreenWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
