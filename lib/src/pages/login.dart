import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/providers/login.provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(create: (context) => LoginModel())
      ],
      child: loginWidgets(context),
    );
  }
}

Widget loginWidgets(BuildContext context) {
  return Scaffold(
    body: SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>(
          (context, state) {
            if (!state.user!.emailVerified) {
              Navigator.pushNamed(context, '/verify-email');
            } else {
              Navigator.pushNamed(context, '/home');
            }
          },
        ),
      ],
    ),
  );
}
