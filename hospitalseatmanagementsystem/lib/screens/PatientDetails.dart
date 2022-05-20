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
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    //const Key centerKey = ValueKey<String>('bottom-sliver-list');

    return  Material(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.cyan,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Expanded(child: SizedBox(height: 30),),
                    Expanded(
                      child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 200),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          //border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    ),
                    
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 200),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          //border: OutlineInputBorder(),
                          labelText: 'Mobile Number',
                        ),
                      ),
                    ),),
                  
                    
                    const Expanded(child: SizedBox(height: 30)),
                    
                    Expanded(child: ElevatedButton(
                      style: style,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SeatData()));
                      },
                      child: const Text('See vacancy Data'),
                    ),),
                    
                    const Expanded(child: SizedBox(height: 30),),
                    
                  ],
                ),
              ),
            ),
          );
        }
      
    
  }

