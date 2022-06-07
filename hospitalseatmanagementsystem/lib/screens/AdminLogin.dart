import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hospitalseatmanagementsystem/screens/SeatData.dart';
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
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20),
        primary: Color.fromRGBO(4,36,73, 1));
    String admin = '', adminPass = '';
    final final_height = MediaQuery.of(context).size.height / 2;
    final final_width = MediaQuery.of(context).size.width / 2;

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
                                      Text('Admin Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                      ),)),
                            ),)
                            ),
                        Expanded(
                            child: Column(children: [
                          Material(
                            child: Center(
                                child: Container(
                              alignment: Alignment.center,
                              //color: Colors.cyan,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 20),
                                      child: TextFormField(
                                          decoration: const InputDecoration(
                                            border: UnderlineInputBorder(),
                                            //border: OutlineInputBorder(),
                                            labelText:
                                                'Enter your username/email',
                                          ),
                                          onChanged: (value) {
                                            admin = value;
                                          })),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 20),
                                    child: TextField(
                                      obscureText: true,
                                      onChanged: (value) {
                                        adminPass = value;
                                      },
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
                                      try {
                                        if (admin == 'admin1@gmail.com') {
                                          if (adminPass == 'topsecret') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                         SeatData()));
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Wrong Admin PASSWORD",
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 3,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          }
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "Wrong Admin ID",
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 3,
                                              backgroundColor: Colors.grey,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        }
                                      } catch (e) {
                                        Fluttertoast.showToast(
                                            msg: e.toString(),
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.grey,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }
                                    },
                                    child: const Text('Admin Login'),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            )),
                          )
                        ]))
                      ])
                    ])))));
  }
}
