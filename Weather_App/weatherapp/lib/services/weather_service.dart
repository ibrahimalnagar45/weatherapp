import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  const WeatherService({required this.dio});

  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = "0735ef2c2b6c450ab16163754232011";

  Future<WeatherModel> getWeather({required cityName}) async {
    try {
      Response response = await dio
          .get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&");
      return WeatherModel.fromjson(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops there is an error ,try later ";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("oops there is an error , try later");
    }
  }
}
