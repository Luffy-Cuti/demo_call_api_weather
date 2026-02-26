import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thoi_tiet/model_api/weather_api.dart';
import 'package:thoi_tiet/page/detail/widget/detail_body.dart';
import 'package:thoi_tiet/provider/weather_pro.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff1D6CF3), Color(0xff19D2FE)],
        ),
      ),
      child: FutureBuilder(
        future: context.read<WeatherPro>().getWeatherDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;

          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  Icon(CupertinoIcons.location, color: Colors.white),
                  SizedBox(width: 15),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Ha Noi City',
                        textStyle: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                Icon(CupertinoIcons.search, color: Colors.white),
                SizedBox(width: 15),
              ],
            ),
            body: DetailBody(listData: listData,),
          );
        }
      ),
    );
  }
}
