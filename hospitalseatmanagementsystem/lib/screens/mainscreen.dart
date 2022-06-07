import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/AdminLogin.dart';
import 'package:hospitalseatmanagementsystem/screens/Hospital.dart';
import 'package:hospitalseatmanagementsystem/screens/Patient.dart';
import 'package:url_launcher/url_launcher.dart';

import 'HospitalRegistration.dart';

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

    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Color.fromRGBO(4,36,73, 1),
    );

    return Container(
      width: double.infinity,
  decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/backgroung.png"),
        fit: BoxFit.cover),
  ),child: Column(
      children: [
        
        Container(
          
          width: final_width * 2,
          height: final_height / 6,
          child: Card(
            color: Color.fromRGBO(4,36,73, 1),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.transparent)),
                elevation: 8,
              shadowColor: Colors.blue,
            child: Padding(
              padding: EdgeInsets.only(left: 900, top: 14),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HospitalRegistration()));
                },
                child: const Text(
                  "Hospital SeatManagement System",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 100, bottom: 100),
            child: Center(
                child: Card(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(color: Colors.white)),
              elevation: 8,
              shadowColor: Colors.blue,
              //margin: EdgeInsets.all(20),

              child: Container(
                  height: final_height,
                  width: final_width,
                  alignment: Alignment.center,
                  //color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      Row(children: [
                        Container(
                            
                            child: Card(
                              color: Color.fromRGBO(4,36,73, 1),
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
                                  child:
                                      Text('Welcome',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                      ),)),
                            ),)
                            ),
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
                                              builder: (context) =>
                                                  const Hospital()));
                                    },
                                    child: const Text('Hospital'),
                                  ),
                                )),

                            const SizedBox(height: 30),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 50),
                                child: Container(
                                  height: 30,
                                  child: ElevatedButton(
                                    //onHover: ,
                                    style: style,
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Patient()));
                                    },
                                    child: const Text('Patient'),
                                  ),
                                )),

                            const SizedBox(height: 30),

                            Center(
                                child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
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
            ))),
        GestureDetector(
          onTap: () {
            launchGithub();
          },
          child: const Text(
            "<Source Code/>",
            style: TextStyle(fontSize: 12, 
            color: Colors.white),
          ),
        ),
      ],
    ),
    );
    
  }

  void launchGithub() {
    const url = 'https://github.com/MeetPatel41011/flutter-projects';
  
 launch(url);
  
  }
}
