import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/AdminLogin.dart';
import 'package:hospitalseatmanagementsystem/screens/Hospital.dart';
import 'package:hospitalseatmanagementsystem/screens/Patient.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}
  
class _FirstScreenState extends State<FirstScreen> {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Hospital()));
            },
            child: const Text('Hospital'),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Patient()));
            },
            child: const Text('Patient'),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminLogin()));
              },
              child: const Text(
                "Admin Login",
                style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
          )
          
        ],
      ),
      )
    );
  }
}
