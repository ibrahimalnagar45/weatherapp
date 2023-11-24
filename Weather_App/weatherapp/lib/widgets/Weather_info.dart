import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubits/get_weather_cubit.dart';
import '../models/weather_model.dart';
import '../screens/HomePage.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weatherModel,
  });
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    WeatherModel weather = BlocProvider.of<GetWeatherCubit>(context).weather!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getWeatherColor(BlocProvider.of<GetWeatherCubit>(context)
                .weather
                ?.weatherstatus),
            getWeatherColor(BlocProvider.of<GetWeatherCubit>(context)
                .weather
                ?.weatherstatus)[300]!,
            getWeatherColor(BlocProvider.of<GetWeatherCubit>(context)
                .weather
                ?.weatherstatus)[200]!,
            getWeatherColor(BlocProvider.of<GetWeatherCubit>(context)
                .weather
                ?.weatherstatus)[100]!,
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weather.cityName,
            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Text(
            "updated at: ${weather.date.hour}:${weather.date.minute}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.network(
                  "https:${weather.image}",
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "${weather.temp}",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Column(
                children: [
                  Text(
                    "max temp : ${weather.maxTemp.round()}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    "min temp : ${weather.minTemp.round()}",
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(weather.weatherstatus,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
