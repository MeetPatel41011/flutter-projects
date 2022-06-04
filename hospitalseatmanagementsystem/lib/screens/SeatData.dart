import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SeatData extends StatefulWidget {
  const SeatData({Key? key}) : super(key: key);

  @override
  State<SeatData> createState() => _SeatDataState();
}

class _SeatDataState extends State<SeatData> {
  Future<void> getData() async {
    // Get docs from collection reference

    CollectionReference firebasefirestore =
        FirebaseFirestore.instance.collection('Hospital');

    QuerySnapshot querySnapshot = await firebasefirestore.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
    Text('$allData');
  }

  Widget build(BuildContext context) {
    //final ButtonStyle style =ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    getData();
    return const Material(
      child: Center(
          child: Text(
        "Seat Data",
      )),
    );
  }
}
