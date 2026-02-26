import 'package:flutter/cupertino.dart';
import 'package:thoi_tiet/model_api/weather_api.dart';
import 'package:thoi_tiet/respon/api_respon.dart';

class WeatherPro extends ChangeNotifier {
  Future<WeatherData> getWeatherCurrent() async {
    WeatherData result = await ApiRespon.callApiGetWeather();
    return result;
  }

  Future<List<WeatherDetail>> getWeatherDetail() async {
    List<WeatherDetail> result =
    await ApiRespon.callApiGetWeatherDetail();
    return result;
  }
}