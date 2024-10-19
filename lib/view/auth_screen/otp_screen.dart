import 'package:amazonapp/constants/common_function.dart';
import 'package:amazonapp/utils/colors.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.mobilenumber});
  final String mobilenumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
            ],
          ),
        ),
      ),
    );
  }
}
