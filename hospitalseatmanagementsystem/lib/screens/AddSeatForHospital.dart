import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/SeatData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddSeatForHospital extends StatefulWidget {
  const AddSeatForHospital({Key? key}) : super(key: key);
  @override
  State<AddSeatForHospital> createState() => _AddSeatForHospitalState();
}

class _AddSeatForHospitalState extends State<AddSeatForHospital> {
  //final _formKey = GlobalKey<FormState>();
  
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
  void dispose() {
    // Clean up the controller when the widget is disposed.
    mildController.dispose();
    moderateController.dispose();
    severeController.dispose();
    criticalController.dispose();
    super.dispose();
  }

  clearText() {
    mildController.clear();
    moderateController.clear();
    severeController.clear();
    criticalController.clear();
  }

  CollectionReference firebasefirestore =
      FirebaseFirestore.instance.collection('Hospital2');

  Future<void> addUser() {
    return firebasefirestore
        .doc('seats')
        //will edit the doc if already available or will create a new doc with this given ID
        .set(
          {
            'mild-seat': mild,
            'moderate-seat': moderate,
            'severe-seat': severe,
            'critical-seat': critical
          },
          SetOptions(merge: true),
          // if set to 'false', then only these given fields will be added to that doc
        )
        .then((value) => debugPrint("User Added"))
        .catchError((error) => debugPrint("Failed to add user: $error"));
  }

  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Material(
      child: Center(
          child: Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
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
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  //border: OutlineInputBorder(),
                  labelText: 'Enter Critical Seat vacancy',
                ),
                controller: criticalController,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: style,
              onPressed: () {
                setState(() {
                  mild = mildController.text;
                  moderate = moderateController.text;
                  severe = criticalController.text;
                  critical = criticalController.text;
                  addUser();
                  clearText();
                });

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SeatData()));
              },
              child: const Text('Add vacancy Seats'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
