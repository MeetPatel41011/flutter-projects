import 'package:flutter/material.dart';

class SeatData extends StatefulWidget {
  const SeatData({Key? key}) : super(key: key);

  @override
  State<SeatData> createState() => _SeatDataState();
}

class _SeatDataState extends State<SeatData> {
  @override
  Widget build(BuildContext context) {
    //final ButtonStyle style =ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return const Material(
      child: Center(
        child: Text(
          "Seat Data",
        )
          ),
    );
  }
}
