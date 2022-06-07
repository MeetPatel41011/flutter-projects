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
    final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;

    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        primary: Color.fromRGBO(4, 36, 73, 1));

    return Container(
      width: double.infinity,
  decoration: const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/backgroung.png"),
        fit: BoxFit.cover),),
        child: Center(
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
                    //color: Colors.white,
                    child: ListView(children: <Widget>[
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
                                      Text('Go further for Hospital',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                      ),)),
                            ),)
                            ),
                        Expanded(
                            child: Column(children: [
                          Center(
                              child: Container(
                            alignment: Alignment.center,
                            //color: Colors.cyan,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Hospitallogin()));
                                  },
                                  child: const Text('Login'),
                                ),
                                const SizedBox(height: 50),
                                ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HospitalRegistration()));
                                  },
                                  child: const Text('Register'),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ))
                        ]))
                      ])
                    ])))));
  }
}
