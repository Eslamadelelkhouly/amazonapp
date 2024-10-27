import 'package:amazonapp/controller/services/auth_services/auth_services.dart';
import 'package:amazonapp/view/auth_screen/auth_screen.dart';
import 'package:amazonapp/view/user/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Signinlogic extends StatefulWidget {
  const Signinlogic({super.key});

  @override
  State<Signinlogic> createState() => _SigninlogicState();
}

class _SigninlogicState extends State<Signinlogic> {
  CheckAuthentication() {
    bool userIsAuthenticated = AuthServices.CheckAuthentication();
    userIsAuthenticated
        ? Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const HomeScreen(),
              type: PageTransitionType.rightToLeft,
            ),
            (route) => false)
        : Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const AuthScreen(),
              type: PageTransitionType.rightToLeft,
            ),
            (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
