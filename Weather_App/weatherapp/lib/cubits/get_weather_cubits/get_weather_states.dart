 

import '../../models/weather_model.dart';

class WeatherState {}

class WeatherIntialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {

  final WeatherModel weather;

  WeatherLoadedState({required this.weather});
  
}

class WeatherFaluireState extends WeatherState {}
