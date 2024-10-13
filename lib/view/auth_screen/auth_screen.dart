import 'package:amazonapp/constants/common_function.dart';
import 'package:amazonapp/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = true;
  String currentCountryCode = '+20';
  TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
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
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              CommonFunction.blankSpace(height * 0.02, 0),
              Container(
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: greyShade3,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: greyShade3,
                          ),
                        ),
                        color: greyShade1,
                      ),
                      height: height * 0.06,
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                inLogin = false;
                              });
                            },
                            child: Container(
                              height: height * 0.03,
                              width: height * 0.03,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: grey),
                                color: white,
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.circle,
                                size: height * 0.015,
                                color: inLogin ? transparent : secondaryColor,
                              ),
                            ),
                          ),
                          CommonFunction.blankSpace(0, width * 0.02),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Create Account',
                                  style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' New to Amazon? ',
                                  style: textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.01,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    inLogin = true;
                                  });
                                },
                                child: Container(
                                  height: height * 0.03,
                                  width: height * 0.03,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: grey),
                                    color: white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.circle,
                                    size: height * 0.015,
                                    color:
                                        !inLogin ? transparent : secondaryColor,
                                  ),
                                ),
                              ),
                              CommonFunction.blankSpace(0, width * 0.02),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Sign in',
                                      style: textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Already a Customer',
                                      style: textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CommonFunction.blankSpace(height * 0.01, 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (value) {
                                      setState(() {
                                        currentCountryCode =
                                            '+${value.phoneCode}';
                                      });
                                    },
                                  );
                                },
                                child: Container(
                                  height: height * 0.06,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: grey,
                                    ),
                                    color: greyShade2,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    currentCountryCode,
                                    style: textTheme.displaySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.06,
                                width: width * 0.64,
                                child: TextField(
                                  controller: mobileController,
                                  style: textTheme.displaySmall,
                                  keyboardType: TextInputType.number,
                                  cursorColor: black,
                                  decoration: InputDecoration(
                                    hintText: 'Mobile number',
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
