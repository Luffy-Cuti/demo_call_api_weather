
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thoi_tiet/page/bottom_custom/bottom_cus.dart';


import '../provider/weather_pro.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherPro(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:BottomNavigationCustom(),
      ),
    );

  }

}

