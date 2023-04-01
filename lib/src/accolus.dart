import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/pages/home.dart';
import 'package:flutter_firebase_auth/src/pages/login.dart';

class Accolus extends StatelessWidget {
  const Accolus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/verify-email': (context) => EmailVerificationScreen(
              actions: [
                EmailVerifiedAction(() {
                  Navigator.pushReplacementNamed(context, '/home');
                }),
                AuthCancelledAction((context) {
                  FirebaseUIAuth.signOut(context: context);
                  Navigator.pushReplacementNamed(context, '/');
                }),
              ],
            ),
        '/email-link-sign-in': (context) => EmailLinkSignInScreen(
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) {
                  Navigator.pushReplacementNamed(context, '/home');
                }),
              ],
            ),
      },
    );
  }
}
