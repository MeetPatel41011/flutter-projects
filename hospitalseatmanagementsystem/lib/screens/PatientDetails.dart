import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/SeatData.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        primary: Color.fromRGBO(4, 36, 73, 1));
    //const Key centerKey = ValueKey<String>('bottom-sliver-list');
    final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;

    return Container(
       width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgroung.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
            child: Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
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
                                      Text('Patient Details',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                      ),)),
                            ),)
                            ),
                        Expanded(
                            child: Column(children: [
                          Container(
                            alignment: Alignment.center,
                            //color: Colors.cyan,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                //const Expanded(child: SizedBox(height: 30),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      //border: OutlineInputBorder(),
                                      labelText: 'Username',
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(),
                                      //border: OutlineInputBorder(),
                                      labelText: 'Mobile Number',
                                    ),
                                  ),
                                ),

                                //const Expanded(child: SizedBox(height: 30)),

                                ElevatedButton(
                                  style: style,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SeatData()));
                                  },
                                  child: const Text('See vacancy Data'),
                                ),

                                //const Expanded(child: SizedBox(height: 30),),
                              ],
                            ),
                          ),
                        ]))
                      ])
                    ])))));
  }
}
