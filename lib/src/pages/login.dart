import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/src/pages/home.dart';
import 'package:flutter_firebase_auth/src/providers/login.provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginModel>(create: (context) => LoginModel())
      ],
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
            return loginWidgets(context);
          }

          return const HomePage();
        },
      ),
    );
  }
}

Widget loginWidgets(BuildContext context) {
  double signInHeight = MediaQuery.of(context).size.height -
      MediaQuery.of(context).size.height / 3;

  return Scaffold(
    body: Column(
      children: [
        credentialInput(context),
        SizedBox(
          height: signInHeight,
          child: Align(
            alignment: Alignment.topCenter,
            child: SignInScreen(
              providers: [
                GoogleProvider(
                    clientId:
                        '755606276866-3nd0gqug7s53niflbgtrvs4gscl56b72.apps.googleusercontent.com'),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget credentialInput(BuildContext context) {
  const double sidePadding = 48.0;
  double inputHeight = MediaQuery.of(context).size.height / 3;

  return Container(
    height: inputHeight,
    child: Padding(
      padding: const EdgeInsets.only(left: sidePadding, right: sidePadding),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer<LoginModel>(
              builder: (context, login, child) {
                return TextField(
                  controller: login.uText,
                  onChanged: (value) => login.changeUsername(value),
                  decoration: InputDecoration(
                      errorText:
                          (login.usernameInvalid) ? 'Username invalid!' : null,
                      border: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0)))),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 18.0),
            ),
            Consumer<LoginModel>(
              builder: (context, login, child) => TextField(
                controller: login.pText,
                onChanged: (value) => login.changePassword(value),
                decoration: InputDecoration(
                    errorText:
                        (login.passwordInvalid) ? 'Password invalid!' : null,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 18.0),
            ),
            ElevatedButton(
              onPressed: () => print(
                  Provider.of<LoginModel>(context, listen: false).toString()),
              child: const Text('See value'),
            )
          ],
        ),
      ),
    ),
  );
}
