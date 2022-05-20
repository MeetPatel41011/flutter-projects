import 'package:flutter/material.dart';
import 'package:hospitalseatmanagementsystem/screens/HospitalUpdateSeat.dart';

class HospitalRegistration extends StatefulWidget {
  const HospitalRegistration({Key? key}) : super(key: key);

  @override
  State<HospitalRegistration> createState() => _HospitalRegistrationState();
}

class _HospitalRegistrationState extends State<HospitalRegistration> {
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
                          labelText: 'Hospital Name',
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
                          labelText: 'Hospital Caption',
                        ),
                      ),
                    ),),
                    
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 200),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          //border: OutlineInputBorder(),
                          labelText: 'Hospital Address',
                        ),
                      ),
                    ),),
                    
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 200),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          //border: OutlineInputBorder(),
                          labelText: 'Hospital Contact Number',
                        ),
                      ),
                    ),),
                    
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 200),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          //border: OutlineInputBorder(),
                          labelText: 'Hospital Contact Number (2)',
                        ),
                      ),
                    ),),
                    
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 200),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          //border: OutlineInputBorder(),
                          labelText: 'Hospital Email',
                        ),
                      ),
                    ),),
                    
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 200),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          //border: OutlineInputBorder(),
                          labelText: 'Hospital Password',
                        ),
                      ),
                    ),),
                    
                    const Expanded(child: SizedBox(height: 30)),
                    
                    Expanded(child: ElevatedButton(
                      style: style,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HospitalUpdateSeat()));
                      },
                      child: const Text('Register Hospital'),
                    ),),
                    
                    const Expanded(child: SizedBox(height: 30),),
                    
                  ],
                ),
              ),
            ),
          );
        }
      
    
  }

