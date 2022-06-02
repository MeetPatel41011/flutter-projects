import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/HospitalUpdateSeat.dart';
import 'package:hospitalseatmanagementsystem/screens/HospitalRegistration.dart';
import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Hospitallogin extends StatefulWidget {
  const Hospitallogin({Key? key}) : super(key: key);

  @override
  State<Hospitallogin> createState() => _HospitalloginState();
}

class _HospitalloginState extends State<Hospitallogin> {
  CollectionReference firebasefirestore =
      FirebaseFirestore.instance.collection('Hospital');

  var hospitaleamil = '';

  final hospitalEmailController = TextEditingController();

  @override

  void dispose() {
    // Clean up the controller when the widget is disposed.
    hospitalEmailController.dispose();
    super.dispose();
  }

  clearText() {
    hospitalEmailController.clear();
  }

  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    String email = '', pass = '';

    return Material(
      child: Center(
          child: Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  //border: OutlineInputBorder(),
                  labelText: 'Enter your username/email',
                ),
                controller: hospitalEmailController,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextField(
                onChanged: (value) {
                  pass = value;
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  //border: OutlineInputBorder(),
                  labelText: 'Enter your Password',
                ),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: style,
              onPressed: () async {
                setState(() {
                      hospitaleamil = hospitalEmailController.text;
                      //clearText();
                    });
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(email: email, password: pass);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HospitalUpdateSeat(title: hospitaleamil)));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    Fluttertoast.showToast(
                        msg: "No user found for that email.",
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (e.code == 'wrong-password') {
                    Fluttertoast.showToast(
                        msg: "Wrong password provided for that user.",
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: GestureDetector(
                onTap: () {
        

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HospitalRegistration()));
                },
                child: const Text(
                  "Haven't Registered yet?",
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
