import 'package:flutter/material.dart';

Widget currentHumidity(IconData icon, String humidity) {
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
            "$humidity",
            style: TextStyle(fontSize: 30),
          ),
          Text("Humidity (g.m^-3)")
        ],
      )
    ],
  );
}
