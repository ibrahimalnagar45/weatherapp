 
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherIntialState());
  WeatherModel? weather;
  getWeather({required String cityname}) async {
    try {
        weather =
          await WeatherService(dio: Dio()).getWeather(cityName: cityname);
      emit(WeatherLoadedState(weather: weather! ));
    } catch (e) {
      emit(WeatherFaluireState());
    }
  }
}
