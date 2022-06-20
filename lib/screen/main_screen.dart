// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:weather/models/weather_model.dart';
import 'package:weather/widgets/weather_card.dart';
import '../widgets/weather_hours.dart';

class MainScreenWrapper extends StatelessWidget {
  final Weather? weather;
  final List<Weather>? hourlyWeather;

  const MainScreenWrapper({
    Key? key,
    required this.weather,
    required this.hourlyWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather!.cityName,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(weather!.description),
        const Spacer(),
        WeatherCard(
          title: "Now",
          temperature: weather!.temperature,
          iconCode: weather!.iconCode,
          temperatureFontSize: 64,
          iconScale: 1,
        ),
        const Spacer(),
        HourlyWeather(hourlyWeather: hourlyWeather!)
      ],
    );
  }
}
