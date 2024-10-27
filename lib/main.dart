import 'package:amazonapp/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazonapp/firebase_options.dart';
import 'package:amazonapp/utils/theme.dart';
import 'package:amazonapp/view/auth_screen/auth_screen.dart';
import 'package:amazonapp/view/user/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
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
      providers: [
        ChangeNotifierProvider<AuthProviderCreater>(
          create: (_) => AuthProviderCreater(),
        ),
      ],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        // home: OtpScreen(
        //   mobilenumber: '+91101101010',
        // ),
        home: HomeScreen(),
      ),
    );
  }
}
