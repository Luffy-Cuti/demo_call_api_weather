import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thoi_tiet/model_api/weather_api.dart';
import 'package:thoi_tiet/page/home/widget/home_detail_weather.dart';
import 'package:thoi_tiet/page/home/widget/home_location.dart';
import 'package:thoi_tiet/page/home/widget/home_tem.dart';
import 'package:thoi_tiet/page/home/widget/home_weather_icon.dart';

import '../../provider/weather_pro.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherPro>().getWeatherCurrent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
          ),
        ),
        child: FutureBuilder(
          future: context.read<WeatherPro>().getWeatherCurrent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return Container(child: Text('No data'));
            }
            WeatherData data = snapshot.data as WeatherData;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomeWeatherIcon(nameIcon: data.weather[0].main),
                home_tem(temp: data.main.temp),
                HomeLocation(location: data.name),
                SizedBox(height: 40),
                HomeDetailWeather(
                  hum: data.main.humidity,
                  speedWin: data.wind.speed,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
