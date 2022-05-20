import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/Hospitallogin.dart';
import 'package:hospitalseatmanagementsystem/screens/HospitalRegistration.dart';

class Hospital extends StatefulWidget {
  const Hospital({Key? key}) : super(key: key);

  @override
  State<Hospital> createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Hospitallogin()));
            },
            child: const Text('Login'),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HospitalRegistration()));
            },
            child: const Text('Register'),
          ),
          const SizedBox(height: 30),  
        ],
      ),
      )
    );
  }
}
