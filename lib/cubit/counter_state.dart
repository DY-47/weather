part of 'counter_cubit.dart';

enum CounterStatus { initial, loading, loaded }

class CounterState {
  final CounterStatus _status;
  final Weather? _weather;

  CounterState({
    required CounterStatus status,
    Weather? weather,
  })  : _status = status,
        _weather = weather;

  CounterStatus get status => _status;

  Weather? get weather => _weather;

  CounterState copyWith({
    CounterStatus? status,
    Weather? weather,
  }) {
    return CounterState(
      status: status ?? _status,
      weather: weather ?? _weather,
    );
  }
}
