import 'package:flutter/material.dart';

Widget currentWindSpeed(IconData icon, String windSpeed) {
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
            "$windSpeed",
            style: TextStyle(fontSize: 30),
          ),
          Text("Wind Speeed (mph)")
        ],
      )
    ],
  );
}
