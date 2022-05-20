import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/HospitalUpdateSeat.dart';
import 'package:hospitalseatmanagementsystem/screens/HospitalRegistration.dart';

class Hospitallogin extends StatefulWidget {
  const Hospitallogin({Key? key}) : super(key: key);

  @override
  State<Hospitallogin> createState() => _HospitalloginState();
}

class _HospitalloginState extends State<Hospitallogin> {
  @override
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                //border: OutlineInputBorder(),
                labelText: 'Enter your username/email',
              ),
            ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextFormField(
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HospitalUpdateSeat()));
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 30),

            Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HospitalRegistration()));
              },
              child: const Text(
                "Haven't Registered yet?",
                style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Hospitallogin()));
              },
              child: const Text(
                "Alredy Registered?",
                style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
          )
          ],
        ),
      )),
    );
  }
}
