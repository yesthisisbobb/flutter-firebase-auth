import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'firebase_options.dart';
import './src/accolus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuth.instance.signOut();

  FirebaseUIAuth.configureProviders([
    GoogleProvider(
        clientId:
            '755606276866-3nd0gqug7s53niflbgtrvs4gscl56b72.apps.googleusercontent.com'),
    EmailAuthProvider(),
  ]);

  runApp(const Accolus());
}
