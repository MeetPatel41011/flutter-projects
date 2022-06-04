import 'package:flutter/material.dart';

import 'package:hospitalseatmanagementsystem/screens/PatientDetails.dart';
import 'package:hospitalseatmanagementsystem/screens/SeatData.dart';

class Patient extends StatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientDetails()));
            },
            child: const Text('Fill Details'),
          ),
          const SizedBox(height: 50),
          
          FloatingActionButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  SeatData()));
            
          },
          child: const Text(
            "SOS"
          ),)
          
        ],
      ),
      )
    );
  }
}
