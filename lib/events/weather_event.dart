import 'package:equatable/equatable.dart';

//чтобы BLoC понимал, что запрашиваем данные по названию города
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  final String city;
  final String lat;
  final String lon;

  const WeatherRequested({
    required this.city,
    this.lat = '',
    this.lon = '',
  });

  @override
  List<Object> get props => [city];
}
