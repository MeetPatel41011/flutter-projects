import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/Hospitallogin.dart';
import 'AddSeatForHospital.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HospitalRegistration extends StatefulWidget {
  const HospitalRegistration({Key? key}) : super(key: key);

  @override
  State<HospitalRegistration> createState() => _HospitalRegistrationState();
}

class _HospitalRegistrationState extends State<HospitalRegistration> {
  CollectionReference firebasefirestore =
      FirebaseFirestore.instance.collection('Hospital');
  //final _formKey = GlobalKey<FormState>();

  //var firebaseUser = FirebaseAuth.instance.currentUser;
  //var uid = '';
  //final uid = firebaseUser!.uid.toString();
  var hospitalname = '',
      hospitalcaption = '',
      hospitaladdress = '',
      hospitalcontactnum = '',
      hospitalcontactnum2 = '',
      hospitaleamil = '',
      hospitalpassword = '';
  var uid = '';
  var hospitalName = "";
  var hospitalCaption = "";
  var hospitalAddress = "";
  var hospitalContactNum = "";
  var hospitalContactNum2 = "";
  var hospitalEmail = "";
  var hospitalPassword = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final hospitalNameController = TextEditingController();
  final hospitalCaptionController = TextEditingController();
  final hospitalAddressController = TextEditingController();
  final hospitalContactNumController = TextEditingController();
  final hospitalContactNum2Controller = TextEditingController();
  final hospitalEmailController = TextEditingController();
  final hospitalPasswordController = TextEditingController();

  @override
  //void dispose() {
    // Clean up the controller when the widget is disposed.
    //ospitalNameController.dispose();
    //hospitalCaptionController.dispose();
    //hospitalAddressController.dispose();
    //hospitalContactNumController.dispose();
    //hospitalContactNum2Controller.dispose();
    //hospitalEmailController.dispose();
    //hospitalPasswordController.dispose();
    //myController.dispose();
    //super.dispose();
  //}

  //clearText() {
    //hospitalNameController.clear();
    //hospitalCaptionController.clear();
    //hospitalAddressController.clear();
    //hospitalContactNumController.clear();
    //hospitalContactNum2Controller.clear();
    //hospitalEmailController.clear();
    //hospitalPasswordController.clear();
  //}

  String email = '', pass = '', name = '';
  Future<void> addUser() {
    return firebasefirestore
        .doc(hospitalEmailController.text)
        //will edit the doc if already available or will create a new doc with this given ID
        .set(
          {
            'Hospital-name': hospitalname,
            'Hospital-caption': hospitalcaption,
            'Hospital-Address': hospitaladdress,
            'Hospital-contactNumber': hospitalcontactnum,
            'Hospital-contactNumber2': hospitalcontactnum2,
            'Hospital-EmailAddress': hospitaleamil,
            'Hospital-password': hospitalpassword,
            'user-id': uid
          },
          SetOptions(merge: true),
          // if set to 'false', then only these given fields will be added to that doc
        )
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
        final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;
    //const Key centerKey = ValueKey<String>('bottom-sliver-list');

    return Center(
        child: Card(

          shape:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), 
              borderSide: BorderSide(color: Colors.white)
          ),
          elevation: 8,
          shadowColor: Colors.grey,
          //margin: EdgeInsets.all(20),


      
      child: Container(
        
        height: final_height/0.54,
      width: final_width,
      alignment: Alignment.center,
      color: Colors.white,
      
          
          child: ListView(
            children: <Widget>[
              Row(children: [
                
                  Container(
                    color: Colors.lightBlue,
                    child:  Padding(
                      padding: EdgeInsets.only(top:final_height/1.08, bottom:final_height/1.08, right: 50, left: 50,),
                      child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Hospital Seat Management System')
                    ),)
                    
                    ),
                    
                Expanded(child: Column(
                  children: [
    
    
    Container(
          alignment: Alignment.center,
          //color: Colors.cyan,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              
              
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Name',
                    ),
                    controller: hospitalNameController,
                  ),
                ),
              
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Caption',
                    ),
                    controller: hospitalCaptionController,
                  ),
                ),
              
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Address',
                    ),
                    controller: hospitalAddressController,
                  ),
                ),
              
             Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Contact Number',
                    ),
                    controller: hospitalContactNumController,
                  ),
                ),
              
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Contact Number (2)',
                    ),
                    controller: hospitalContactNum2Controller,
                  ),
                ),
              
            Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Email',
                    ),
                    controller: hospitalEmailController,
                  ),
                ),
              
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      pass = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      //border: OutlineInputBorder(),
                      labelText: 'Hospital Password',
                    ),
                    controller: hospitalPasswordController,
                  ),
                ),
              
              //const Expanded(child: SizedBox(height: 30)),
              ElevatedButton(
                  style: style,
                  onPressed: () async {
                    const Center(child: CircularProgressIndicator());
                    setState(() {
                      hospitalname = hospitalNameController.text;
                      hospitalcaption = hospitalCaptionController.text;
                      hospitaladdress = hospitalAddressController.text;
                      hospitalcontactnum = hospitalContactNumController.text;
                      hospitalcontactnum2 = hospitalContactNum2Controller.text;
                      hospitaleamil = hospitalEmailController.text;
                      hospitalpassword = hospitalPasswordController.text;
                      
                      addUser();
                      //clearText();
                    });
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: email, password: pass);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddSeatForHospital(
                                  title: hospitalEmailController.text)));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        Fluttertoast.showToast(
                            msg: "The password provided is too weak.",
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (e.code == 'email-already-in-use') {
                        Fluttertoast.showToast(
                            msg: "The account already exists for that email.",
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Text('Register Hospital'),
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
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      
  
                  ]
                )
                )
              ]
              )
            ]
          )
      )
        )
    );
  }
}
