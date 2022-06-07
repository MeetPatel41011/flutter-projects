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

  //clearText() {
  //hospitalEmailController.clear();
  //}

  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
        primary: Color.fromRGBO(4,36,73, 1));
    String email = '', pass = '';
    final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;

    return Container(
      width: double.infinity,
  decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/backgroung.png"),
        fit: BoxFit.cover),),
        child: Center(
            child: Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.white)),
                elevation: 8,
                shadowColor: Colors.grey,
                //margin: EdgeInsets.all(20),

                child: Container(
                    height: final_height,
                    width: final_width,
                    alignment: Alignment.center,
                    //color: Colors.white,
                    child: ListView(children: <Widget>[
                      Row(children: [
                        Container(
                            
                            child: Card(
                              color: Color.fromRGBO(4,36,73, 1),
                              shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: Colors.white)),
                            elevation: 8,
                            shadowColor: Colors.grey,
                              child: Padding(
                              padding: EdgeInsets.only(
                                top: final_height / 2.5,
                                bottom: final_height / 2,
                                right: 80,
                                left: 80,
                              ),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      Text('Hospital Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                      ),)),
                            ),)
                            ),
                        Expanded(
                            child: Column(children: [
                          Container(
                            alignment: Alignment.center,
                            //color: Colors.cyan,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: TextField(
                                    obscureText: true,
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
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  style: style,
                                  onPressed: () async {
                                    const Center(
                                        child: CircularProgressIndicator());
                                    setState(() {
                                      hospitaleamil =
                                          hospitalEmailController.text;
                                      //clearText();
                                    });
                                    try {
                                      UserCredential userCredential =
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: email, password: pass);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HospitalUpdateSeat(
                                                      title: hospitaleamil)));
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'user-not-found') {
                                        Fluttertoast.showToast(
                                            msg:
                                                "No user found for that email.",
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.grey,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else if (e.code == 'wrong-password') {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Wrong password provided for that user.",
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0.001),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HospitalRegistration()));
                                    },
                                    child: const Text(
                                      "Haven't Registered yet?",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]))
                      ])
                    ])))));
  }
}
