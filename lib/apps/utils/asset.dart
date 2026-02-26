import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const link = 'assets/images/weather/';

class Asset {
  static String getLinkImg(String name) =>
      '$link${name.replaceAll(' ', '').toLowerCase()}.png';
}

class MyKey {
  static const String api_token = '6521aed407c3f0289277987f7d42a876';
}

Widget createTempIcon(num temp, { double size = 100}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        temp.round().toString(),
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Text(
        '0',
        style: TextStyle(
          fontSize: size/3,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ],
  );
}
