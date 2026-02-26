import 'package:dio/dio.dart';
import 'package:thoi_tiet/apps/utils/asset.dart';
import 'package:thoi_tiet/model_api/weather_api.dart';

class ApiRespon {
  static Future<WeatherData> callApiGetWeather() async {
    final dio = Dio();
    final res = await dio.get(
      'https://api.openweathermap.org/data/2.5/weather?lat=20.999154&lon=105.801359&appid=${MyKey.api_token}&units=metric',
    );
    final data = res.data;
    WeatherData result = WeatherData.fromMap(data);
    return result;
  }

  static Future<List<WeatherDetail>> callApiGetWeatherDetail() async {
    final dio = Dio();
    final res = await dio.get(
      'https://api.openweathermap.org/data/2.5/forecast?lat=21.003788&lon=105.799443&appid=${MyKey.api_token}&units=metric',
    );
    List data = res.data['list'];
    List<WeatherDetail> result = List<WeatherDetail>.from(data
        .map((e) => WeatherDetail.fromMap(e))
        .toList());
    return result;
  }
}
