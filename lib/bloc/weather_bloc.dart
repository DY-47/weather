import 'package:bloc/bloc.dart';
import 'package:weather/events/weather_event.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/states/weather_state.dart';

//WeatherEvent – события, которые он будет обрабатывать
//WeatherState – состояния, в которых он может быть
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String cityName;

  WeatherBloc(this.cityName, WeatherState initState) : super(initState) {
    add(WeatherRequested(
      city: cityName.toString(),
    ));
  }

  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather =
            await WeatherService.fetchCurrentWeather(query: event.city);
        final List<Weather> hourlyWeather =
            await WeatherService.fetchHourlyWeather(query: event.city);
        yield WeatherLoadSuccess(
            weather: weather, hourlyWeather: hourlyWeather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}
