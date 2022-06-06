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
    final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;
    print('$final_height');
    print('$final_width');

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
          child: ListView(
            children: <Widget>[
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
                    child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.1),
                        child: Container(
                          height: 30,
                          child: ElevatedButton(
                            style: style,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Hospital()));
                            },
                            child: const Text('Hospital'),
                          ),
                        )),

                    //const SizedBox(height: 50),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                        child: Container(
                          height: 30,
                          child: ElevatedButton(
                            //onHover: ,
                            style: style,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Patient()));
                            },
                            child: const Text('Patient'),
                          ),
                        )),

                    //const SizedBox(height: 2),

                    Center(
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdminLogin()));
                              },
                              child: const Text(
                                "Admin Login",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            )))
                  ],
                ))
              ]),
            ],
          )),
    ));
  }
}
