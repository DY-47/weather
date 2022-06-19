import 'package:bloc/bloc.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final WeatherService _weatherService;

  CounterCubit({required WeatherService weatherService})
      : _weatherService = weatherService,
        super(CounterState(status: CounterStatus.initial));

  Future fetch() async {
    emit(state.copyWith(status: CounterStatus.loading));
    final response =
        await _weatherService.fetchCurrentWeather(lon: '139', lat: '35');

    emit(state.copyWith(
      status: CounterStatus.loaded,
      weather: response,
    ));
  }
}
