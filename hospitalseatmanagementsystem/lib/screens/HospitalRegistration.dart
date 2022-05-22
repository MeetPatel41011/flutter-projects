import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/Hospitallogin.dart';

import 'AddSeatForHospital.dart';

class HospitalRegistration extends StatefulWidget {
  const HospitalRegistration({Key? key}) : super(key: key);

  @override
  State<HospitalRegistration> createState() => _HospitalRegistrationState();
}

class _HospitalRegistrationState extends State<HospitalRegistration> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    //const Key centerKey = ValueKey<String>('bottom-sliver-list');
    String email = '', pass = '';
    return Material(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.cyan,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Expanded(
                child: SizedBox(height: 30),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Name',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Caption',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Address',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Contact Number',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Contact Number (2)',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Email',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
                  child: TextField(
                    onChanged: (value) {
                      pass = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Password',
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox(height: 30)),
              Expanded(
                child: ElevatedButton(
                  style: style,
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: email,
                              password: pass);
                              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddSeatForHospital()));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }

                    
                  },
                  child: const Text('Register Hospital'),
                ),
              ),
              const Expanded(
                child: SizedBox(height: 30),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Hospitallogin()));
                  },
                  child: const Text(
                    "Alredy Registered?",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
