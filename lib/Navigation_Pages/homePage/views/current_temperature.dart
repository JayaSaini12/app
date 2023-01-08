import 'package:flutter/material.dart';

Widget currentTemperature(IconData icon, String temp, String location) {
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
            "$temp",
            style: TextStyle(fontSize: 30),
          ),
          Text("Temperature (°C)")
        ],
      )
    ],
  );
}
