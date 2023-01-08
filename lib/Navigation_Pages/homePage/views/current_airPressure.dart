import 'package:flutter/material.dart';

Widget currentAirPressure(IconData icon, String airPressure) {
  return Row(
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.orange,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "$airPressure",
            style: TextStyle(fontSize: 30),
          ),
          Text("Air Pressure (Pascal)")
        ],
      )
    ],
  );
}
