import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prova/pages/homePage.dart';
import 'package:prova/pages/loginPage.dart';
Future<void> main() async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
 runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class DefaultFirebaseOptions {
  static var currentPlatform;
}
