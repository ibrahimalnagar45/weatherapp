import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubits/get_weather_cubit.dart';
import '../cubits/get_weather_cubits/get_weather_states.dart';
import '../widgets/No_weather.dart';
import '../widgets/Weather_info.dart';
import 'searchPage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return Builder(
            builder: (context) => MaterialApp(
              theme: ThemeData(
                primarySwatch: getWeatherColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weather
                        ?.weatherstatus),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeBage(),
            ),
          );
        },
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.amber;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
      return Colors.lightBlue;
    case 'patchy sleet possible':
      return Colors.lightBlue;
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
    case 'blowing snow':
    case 'blizzard':
      return Colors.deepPurple;

    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
      return Colors.lightBlue;
    case 'freezing drizzle':
      return Colors.lightBlue;
    case 'heavy freezing drizzle':
      return Colors.lightBlue;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain at times':
    case 'moderate rain':
      return Colors.lightBlue;
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.lightBlue;
    case 'light freezing rain':
      return Colors.lightBlue;
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'light sleet':
      return Colors.lightBlue;
    case 'moderate or heavy sleet':
      return Colors.lightBlue;
    case 'patchy light snow':
      return Colors.lightBlue;
    case 'light snow':
      return Colors.lightBlue;
    case 'patchy moderate snow':
      return Colors.lightBlue;
    case 'moderate snow':
      return Colors.lightBlue;
    case 'patchy heavy snow':
      return Colors.lightBlue;
    case 'heavy snow':
      return Colors.lightBlue;
    case 'ice pellets':
      return Colors.lightBlue;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate or heavy rain shower':
      return Colors.lightBlue;
    case 'torrential rain shower':
      return Colors.lightBlue;
    case 'light sleet showers':
      return Colors.lightBlue;
    case 'moderate or heavy sleet showers':
      return Colors.lightBlue;
    case 'light snow showers':
      return Colors.lightBlue;
    case 'moderate or heavy snow showers':
      return Colors.lightBlue;
    case 'light showers of ice pellets':
      return Colors.lightBlue;
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'patchy light rain with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy light snow with thunder':
      return Colors.deepPurple;
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}

class HomeBage extends StatefulWidget {
  const HomeBage({super.key});

  @override
  State<HomeBage> createState() => _HomeBageState();
}

class _HomeBageState extends State<HomeBage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherIntialState) {
            return const NOWeatherInfo();
          } else if (state is WeatherLoadedState) {
            return WeatherInfo(
              weatherModel: state.weather,
            );
          } else {
            return const Center(
                child: Text(
              " oops there is an error try again ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ));
          }
        },
      ),
    );
  }
}
