// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '/api/weather_service.dart';
import '/cubit/counter_cubit.dart';
import '/screen/main_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherService(),
      child: BlocProvider(
        create: (context) => CounterCubit(weatherService: WeatherService()),
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            if (state.status == CounterStatus.initial) {
              context.read<CounterCubit>().fetch();
            }
            if (state.status == CounterStatus.loaded) {
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                  actions: [
                    IconButton(
                      onPressed: () {
                        // showSearch(
                        //   context: context,
                        //   delegate: MySearchDelegate(
                        //     (query) {
                        //       BlocProvider.of<WeatherBloc>(context)
                        //           .add(WeatherRequested(city: query));
                        //     },
                        //   ),
                        // );
                      },
                      icon: const Icon(Icons.search_rounded),
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: MainScreenWrapper(
                    weather: state.weather,
                    hourlyWeather: state.hourlyWeather!,
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
