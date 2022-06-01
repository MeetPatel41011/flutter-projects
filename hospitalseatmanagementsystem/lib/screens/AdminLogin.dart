import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    String admin = '', adminPass = '';

    return Material(
      child: Center(
          child: Container(
        alignment: Alignment.center,
        color: Colors.cyan,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    //border: OutlineInputBorder(),
                    labelText: 'Enter your username/email',
                  ),
                  onChanged: (value) {
                      admin = value;
                    }
            )
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
              child: TextField(
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

                try{
                  if(admin == 'admin1@gmail.com') {
                    if(adminPass == 'topsecret'){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SeatDataForAdmin()));
                    }else{
                      Fluttertoast.showToast(
                        msg: "Wrong Admin PASSWORD",
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0
                        );
                    }
                  }else{
                    Fluttertoast.showToast(
                        msg: "Wrong Admin ID",
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0
                        );
                  }
                } catch(e){
                  Fluttertoast.showToast(
                        msg: e.toString(),
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 16.0
                        );
                }
              },
              child: const Text('Admin Login'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      )),
    );
  }
}
