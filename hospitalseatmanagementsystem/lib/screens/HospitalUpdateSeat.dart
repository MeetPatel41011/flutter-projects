import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/SeatData.dart';

class HospitalUpdateSeat extends StatefulWidget {
  const HospitalUpdateSeat({Key? key, required this.title}) : super(key: key);
  final String? title;

  @override
  State<HospitalUpdateSeat> createState() => _HospitalUpdateSeatState();
}

class _HospitalUpdateSeatState extends State<HospitalUpdateSeat> {
  var mild = "";
  var moderate = "";
  var severe = "";
  var critical = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final mildController = TextEditingController();
  final moderateController = TextEditingController();
  final severeController = TextEditingController();
  final criticalController = TextEditingController();

  @override
  var firebaseUser = FirebaseAuth.instance.currentUser;
  String uid = '';
  //void dispose() {
  // Clean up the controller when the widget is disposed.
  //mildController.dispose();
  //moderateController.dispose();
  //severeController.dispose();
  //criticalController.dispose();
  //super.dispose();
  //}

  //clearText() {
  //mildController.clear();
  //moderateController.clear();
  //severeController.clear();
  //criticalController.clear();
  //}

  CollectionReference firebasefirestore =
      FirebaseFirestore.instance.collection('Hospital');

  Future<void> updateUser() {
    return firebasefirestore
        .doc(widget.title.toString())
        //will edit the doc if already available or will create a new doc with this given ID
        .set(
          {
            'mild-seat': mild,
            'moderate-seat': moderate,
            'severe-seat': severe,
            'critical-seat': critical,
          },
          SetOptions(merge: true),
          // if set to 'false', then only these given fields will be added to that doc
        )
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
        primary: Color.fromRGBO(4,36,73, 1));
    final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;

    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgroung.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)),
                elevation: 8,
                shadowColor: Colors.grey,
                //margin: EdgeInsets.all(20),

                child: Container(
                    height: final_height / 0.74,
                    width: final_width,
                    alignment: Alignment.center,
                    //color: Colors.white,

                    child: ListView(children: <Widget>[
                      Row(children: [
                        Container(
                            child: Card(
                          color: Color.fromRGBO(4, 36, 73, 1),
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
                                child: Text(
                                  'Update Seats',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          ),
                        )),
                        Expanded(
                            child: Column(children: [
                          Container(
                            alignment: Alignment.center,
                            //color: Colors.cyan,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      //border: OutlineInputBorder(),
                                      labelText: 'Enter Mild seat vacancy',
                                    ),
                                    controller: mildController,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      //border: OutlineInputBorder(),
                                      labelText: 'Enter Moderate Seat vacancy',
                                    ),
                                    controller: moderateController,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      //border: OutlineInputBorder(),
                                      labelText: 'Enter Severe seat vacancy',
                                    ),
                                    controller: severeController,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      //border: OutlineInputBorder(),
                                      labelText: 'Enter Critical Seat vacancy',
                                    ),
                                    controller: criticalController,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    const Center(
                                        child: CircularProgressIndicator());
                                    setState(() {
                                      mild = mildController.text;
                                      moderate = moderateController.text;
                                      severe = criticalController.text;
                                      critical = criticalController.text;
                                      uid = firebaseUser!.uid.toString();
                                      updateUser();
                                      //clearText();
                                    });

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SeatData()));
                                  },
                                  child: const Text('Update Seats vacancy'),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          )
                        ]))
                      ])
                    ])))));
  }
}
