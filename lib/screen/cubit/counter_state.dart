part of 'counter_cubit.dart';

enum CounterStatus { initial, loading, loaded }

class CounterState {
  final CounterStatus _status;
  final Weather? _weather;
  final List<Weather>? _hourlyWeather;

  CounterState({
    required CounterStatus status,
    Weather? weather,
    List<Weather>? hourlyWeather,
  })  : _status = status,
        _hourlyWeather = hourlyWeather,
        _weather = weather;

  CounterStatus get status => _status;

  Weather? get weather => _weather;

  List<Weather>? get hourlyWeather => _hourlyWeather;

  CounterState copyWith({
    CounterStatus? status,
    Weather? weather,
    List<Weather>? hourlyWeather,
  }) {
    return CounterState(
      status: status ?? _status,
      weather: weather ?? _weather,
      hourlyWeather: hourlyWeather ?? _hourlyWeather,
    );
  }
}
