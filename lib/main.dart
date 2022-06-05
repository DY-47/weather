import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/weather_bloc.dart';
import 'package:weather/components/main_screen_wrapper.dart';
import 'package:weather/states/weather_state.dart';

import 'events/weather_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.white,
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc('Moscow'),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          return state is WeatherLoadSuccess
              ? Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                    actions: [
                      IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: MySearchDelegate(
                              (query) {
                                BlocProvider.of<WeatherBloc>(context)
                                    .add(WeatherRequested(city: query));
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.search_rounded),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.only(top: 64),
                    child: MainScreenWrapper(
                      weather: state.weather,
                      hourlyWeather: state.hourlyWeather,
                    ),
                  ),
                )
              : const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        },
      ),
    );
  }
}
