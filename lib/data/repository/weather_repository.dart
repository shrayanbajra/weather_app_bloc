import 'dart:convert';

import 'package:weather_app_bloc/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_bloc/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'Kathmandu';
      final weatherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      print('Weather model => ${WeatherModel.fromMap(data)}');

      return WeatherModel.fromMap(data);
    } catch (e) {
      print('Caught exception => ${e.toString()}');
      throw e.toString();
    }
  }
}
