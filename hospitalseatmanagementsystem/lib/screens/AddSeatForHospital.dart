import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/SeatData.dart';

class AddSeatForHospital extends StatefulWidget {
  const AddSeatForHospital({Key? key}) : super(key: key);

  @override
  State<AddSeatForHospital> createState() => _AddSeatForHospitalState();
}

class _AddSeatForHospitalState extends State<AddSeatForHospital> {
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
                labelText: 'Enter Mild seat vacancy',
              ),
            ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                //border: OutlineInputBorder(),
                labelText: 'Enter Moderate Seat vacancy',
              ),
            ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                //border: OutlineInputBorder(),
                labelText: 'Enter Severe seat vacancy',
              ),
            ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                //border: OutlineInputBorder(),
                labelText: 'Enter Critical Seat vacancy',
              ),
            ),
            ),
            
            
            const SizedBox(height: 50),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SeatData()));
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
