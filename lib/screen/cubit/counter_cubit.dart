// Package imports:
import 'package:bloc/bloc.dart';

// Project imports:
import 'package:weather/models/weather_model.dart';
import 'package:weather/repositories/weather_service.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final WeatherService _weatherService;
  final String cityName = 'Moscow';

  CounterCubit({required WeatherService weatherService})
      : _weatherService = weatherService,
        super(CounterState(status: CounterStatus.initial));

  Future fetch() async {
    emit(state.copyWith(status: CounterStatus.loading));
    final response = await _weatherService.fetchCurrentWeather(city: cityName);

    final responseHourly =
        await _weatherService.fetchHourlyWeather(city: cityName);

    emit(state.copyWith(
      status: CounterStatus.loaded,
      weather: response,
      hourlyWeather: responseHourly,
    ));
  }
}
