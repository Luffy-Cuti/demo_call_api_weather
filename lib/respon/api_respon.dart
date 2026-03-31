import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:thoi_tiet/apps/utils/asset.dart';
import 'package:thoi_tiet/model_api/weather_api.dart';

class ApiRespon {
  static final Dio _dio = Dio()
    ..interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: false,
        requestBody: false,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (object) => debugPrint(object.toString()),
      ),
    );

  static Future<WeatherData> callApiGetWeather() async {
    try {
      const url = 'https://api.openweathermap.org/data/2.5/weather';
      final query = {
        'lat': 20.999154,
        'lon': 105.801359,
        'appid': MyKey.api_token,
        'units': 'metric',
      };
      debugPrint('[API] GET $url');
      debugPrint('[API] query: $query');

      final res = await _dio.get(
        url,
        queryParameters: query,
      );
      return WeatherData.fromMap(res.data);
    } on DioException catch (e) {
      throw Exception('Không thể tải thời tiết hiện tại: ${e.message}');
    }
  }

  static Future<List<WeatherDetail>> callApiGetWeatherDetail() async {
    try {
      const url = 'https://api.openweathermap.org/data/2.5/forecast';
      final query = {
        'lat': 21.003788,
        'lon': 105.799443,
        'appid': MyKey.api_token,
        'units': 'metric',
      };
      debugPrint('[API] GET $url');
      debugPrint('[API] query: $query');

      final res = await _dio.get(
        url,
        queryParameters: query,
      );

      final data = res.data['list'] as List<dynamic>;
      return data.map((e) => WeatherDetail.fromMap(e)).toList();
    } on DioException catch (e) {
      throw Exception('Không thể tải dự báo thời tiết: ${e.message}');
    }
  }
}