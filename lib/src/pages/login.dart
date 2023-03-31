import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/providers/login.provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<LoginModel>(create: (context) => LoginModel())
    ], child: loginWidgets(context));
  }
}

Widget loginWidgets(BuildContext context) {
  double signInHeight = MediaQuery.of(context).size.height -
      MediaQuery.of(context).size.height / 3;

  return Scaffold(
    body: SignInScreen(
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Navigator.pushReplacementNamed(context, '/home');
        }),
      ],
      providers: [
        GoogleProvider(
            clientId:
                '755606276866-3nd0gqug7s53niflbgtrvs4gscl56b72.apps.googleusercontent.com'),
      ],
    ),
  );
}
