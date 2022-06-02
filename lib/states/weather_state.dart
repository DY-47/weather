import 'package:weather/models/weather_model.dart';

abstract class WeatherState {
  const WeatherState();

  List<Object> get props => [];
}

//когда не происходит ничего
class WeatherInitial extends WeatherState {}

//когда загружаем данные о погоде
class WeatherLoadInProgress extends WeatherState {}

//когда данные успешно загружены
class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> hourlyWeather;

  WeatherLoadSuccess({
    required this.weather,
    required this.hourlyWeather,
  });

  @override
  List<Object> get props => [weather];
}

//когда возникла ошибка
class WeatherLoadFailure extends WeatherState {}
