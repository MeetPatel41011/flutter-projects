import 'package:flutter/material.dart';

class SeatDataForAdmin extends StatefulWidget {
  const SeatDataForAdmin({Key? key}) : super(key: key);

  @override
  State<SeatDataForAdmin> createState() => _SeatDataForAdminState();
}

class _SeatDataForAdminState extends State<SeatDataForAdmin> {
  @override
  Widget build(BuildContext context) {
    //final ButtonStyle style =ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return const Material(
      child: Center(
        child: Text(
          "Meet",
        )
          ),
    );
  }
}
