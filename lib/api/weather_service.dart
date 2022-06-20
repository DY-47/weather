// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:weather/models/weather_model.dart';

class WeatherService {
  static const String _apiKey = '26af2b6111d7488f6b1ce3f883e4294e';

  //метод получения текущей погоды
  Future<Weather> fetchCurrentWeather({
    required String city,
  }) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      return throw Exception('Failed ti load weather');
    }
  }

  //метод получения погоды по часам
  Future<List<Weather>> fetchHourlyWeather({
    required String city,
  }) async {
    var url =
        'http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$_apiKey&units=metric';
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
