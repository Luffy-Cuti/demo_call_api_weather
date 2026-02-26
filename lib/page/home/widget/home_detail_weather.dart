import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDetailWeather extends StatelessWidget {
  const HomeDetailWeather({super.key,required this.hum,required this.speedWin});


  final num hum;
  final num speedWin;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/images/icons/Vector-1.png'),
            Text('${speedWin}km/h ',style: TextStyle(fontSize: 21,color: Colors.white),)
          ],
        ),
        Column(
          children: [
            Image.asset('assets/images/icons/humidity.png'),
            Text('${hum}% ',style: TextStyle(fontSize: 21,color: Colors.white),)
          ],
        )
      ],
    ) ;
  }
}
