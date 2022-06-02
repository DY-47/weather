import 'dart:convert';
import 'package:weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _apiKey = '26af2b6111d7488f6b1ce3f883e4294e';

  //метод получения текущей погоды
  static Future<Weather> fetchCurrentWeather({
    query,
    String lat = '',
    String lon = '',
  }) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed ti load weather');
    }
  }

  //метод получения погоды по часам
  static Future<List<Weather>> fetchHourlyWeather({
    required String query,
    String lat = '',
    String lon = '',
  }) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?q=$query&lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data =
          (jsonData["list"] as List<dynamic>).map((item) {
        return Weather.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
