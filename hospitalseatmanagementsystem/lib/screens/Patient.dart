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
    final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
        child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            elevation: 8,
            shadowColor: Colors.grey,
            //margin: EdgeInsets.all(20),

            child: Container(
                height: final_height,
                width: final_width,
                alignment: Alignment.center,
                color: Colors.white,
                child: ListView(children: <Widget>[
                  Row(children: [
                    Container(
                        color: Colors.lightBlue,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: final_height / 2,
                            bottom: final_height / 2,
                            right: 50,
                            left: 50,
                          ),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Hospital Seat Management System')),
                        )),
                    Expanded(
                        child: Column(children: [
                      Container(
                        alignment: Alignment.center,
                        //color: Colors.cyan,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 50, bottom: 200),
                            child: ElevatedButton(
                              style: style,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PatientDetails()));
                              },
                              child: const Text('Fill Details'),
                            ),
                            ),
                            
                            //const SizedBox(height: 200),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: FloatingActionButton(onPressed: () {
                                  
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SeatData()));
                                  
                                },
                                child: Text("SOS"),
                                hoverColor: Color.fromARGB(255, 245, 10, 10)))
                          ],
                        ),
                      )
                    ]))
                  ])
                ]))));
  }
}
