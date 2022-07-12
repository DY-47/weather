// Flutter imports:
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;

  const WeatherCard({
    Key? key,
    required this.temperature,
    required this.iconCode,
    required this.temperatureFontSize,
    this.iconScale = 1,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          Image.network(
            "http://openweathermap.org/img/wn/$iconCode@2x.png",
          ),
          Text(
            temperature.toString() + '°',
            style: TextStyle(
              fontSize: temperatureFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
