import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hospitalseatmanagementsystem/screens/mainscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBB_HV0ivUefyWNnRzXj_dk9XdWEOUWUWw",
      authDomain: "hospitalseatmanagementsy-e478b.firebaseapp.com",
      projectId: "hospitalseatmanagementsy-e478b",
      storageBucket: "hospitalseatmanagementsy-e478b.appspot.com",
      messagingSenderId: "859685172147",
      appId: "1:859685172147:web:e85b38a6ba6920036211c6",
      measurementId: "G-0YE7ZGKSYN"
      ),
    );
  }

  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Flutter App",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("My First App Screen"),
            ),
            body: const FirstScreen()));
  }
}
