import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/SeatDataForAdmin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SeatDataForAdmin()));
              },
              child: const Text('Login As An Admin!'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
