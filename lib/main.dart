import 'package:amazonapp/firebase_options.dart';
import 'package:amazonapp/utils/theme.dart';
import 'package:amazonapp/view/auth_screen/otp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: OtpScreen(
          mobilenumber: '+91101101010',
        ),
        // home: AuthScreen(),
      ),
    );
  }
}
